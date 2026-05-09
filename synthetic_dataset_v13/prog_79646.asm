; DESCRIPTION: Composite: Places a green line segment connecting (248, 74) to (363, 69) then Places a green 33x81 rectangle at position (22, 51) then Places a orange dot at position (248, 199).
; PLAN: r0=248(x1), r1=74(y1), r2=363(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=51(y), r7=33(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x), r11=199(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 74
LDI r2, 363
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 51
LDI r7, 33
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 199
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
