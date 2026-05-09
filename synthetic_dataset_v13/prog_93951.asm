; DESCRIPTION: Composite: Places a yellow line segment connecting (340, 18) to (185, 8) then Places a green 99x73 rectangle at position (189, 69) then Places a orange dot at position (363, 250).
; PLAN: r0=340(x1), r1=18(y1), r2=185(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=69(y), r7=99(width), r8=73(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=363(x), r11=250(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 18
LDI r2, 185
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 69
LDI r7, 99
LDI r8, 73
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 250
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
