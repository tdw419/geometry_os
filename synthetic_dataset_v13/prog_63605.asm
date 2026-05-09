; DESCRIPTION: Composite: Places a blue line segment connecting (75, 44) to (433, 229) then Places a magenta circle of radius 69 at center (400, 124) then Places a orange dot at position (14, 179).
; PLAN: r0=75(x1), r1=44(y1), r2=433(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=124(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=14(x), r11=179(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 75
LDI r1, 44
LDI r2, 433
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 124
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 14
LDI r11, 179
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
