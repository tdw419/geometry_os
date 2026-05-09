; DESCRIPTION: Composite: Renders a magenta disk with center (187, 75) and radius 53 then Places a cyan dot at position (26, 206) then Renders a purple box of size 13x85 starting at (85, 166).
; PLAN: r0=187(x), r1=75(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=206(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=85(x), r11=166(y), r12=13(width), r13=85(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 75
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 206
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 85
LDI r11, 166
LDI r12, 13
LDI r13, 85
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
