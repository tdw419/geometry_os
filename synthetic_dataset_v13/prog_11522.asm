; DESCRIPTION: Composite: Places a orange dot at position (55, 230) then Places a blue line segment connecting (491, 198) to (457, 21).
; PLAN: r0=55(x), r1=230(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=491(x1), r6=198(y1), r7=457(x2), r8=21(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 230
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 491
LDI r6, 198
LDI r7, 457
LDI r8, 21
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
