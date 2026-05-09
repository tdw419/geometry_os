; DESCRIPTION: Composite: Draws a cyan circle centered at (200, 11) with radius 10 then Places a orange line segment connecting (254, 211) to (312, 30) then Places a orange dot at position (508, 233).
; PLAN: r0=200(x), r1=11(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x1), r6=211(y1), r7=312(x2), r8=30(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=508(x), r11=233(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 11
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 211
LDI r7, 312
LDI r8, 30
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 233
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
