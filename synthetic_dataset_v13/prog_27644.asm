; DESCRIPTION: Composite: Draws a white rectangle at (155, 9) with width 19 and height 32 then Places a orange dot at position (93, 5) then Places a green line segment connecting (279, 1) to (468, 242).
; PLAN: r0=155(x), r1=9(y), r2=19(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=5(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=279(x1), r11=1(y1), r12=468(x2), r13=242(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 9
LDI r2, 19
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 5
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 279
LDI r11, 1
LDI r12, 468
LDI r13, 242
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
