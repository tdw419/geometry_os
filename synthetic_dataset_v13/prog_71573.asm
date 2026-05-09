; DESCRIPTION: Composite: Draws a blue rectangle at (86, 124) with width 51 and height 79 then Places a orange line segment connecting (1, 197) to (248, 31) then Sets a single green pixel at (194, 112).
; PLAN: r0=86(x), r1=124(y), r2=51(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x1), r6=197(y1), r7=248(x2), r8=31(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=112(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 86
LDI r1, 124
LDI r2, 51
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 197
LDI r7, 248
LDI r8, 31
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 112
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
