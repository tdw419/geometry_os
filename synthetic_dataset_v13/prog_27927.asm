; DESCRIPTION: Composite: Draws a blue circle centered at (433, 148) with radius 42 then Places a yellow dot at position (175, 153) then Renders a cyan box of size 56x113 starting at (425, 108).
; PLAN: r0=433(x), r1=148(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=153(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=425(x), r11=108(y), r12=56(width), r13=113(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 148
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 153
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 425
LDI r11, 108
LDI r12, 56
LDI r13, 113
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
