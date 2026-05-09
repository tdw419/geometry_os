; DESCRIPTION: Composite: Places a green line segment connecting (159, 219) to (283, 138) then Draws a yellow rectangle at (278, 115) with width 54 and height 79 then Sets a single magenta pixel at (365, 179).
; PLAN: r0=159(x1), r1=219(y1), r2=283(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=115(y), r7=54(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=179(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 219
LDI r2, 283
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 115
LDI r7, 54
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 179
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
