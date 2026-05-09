; DESCRIPTION: Composite: Creates a magenta circular shape at (84, 95) with radius 69 then Renders a blue box of size 23x102 starting at (272, 141) then Places a yellow dot at position (72, 36).
; PLAN: r0=84(x), r1=95(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=141(y), r7=23(width), r8=102(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=72(x), r11=36(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 84
LDI r1, 95
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 141
LDI r7, 23
LDI r8, 102
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 36
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
