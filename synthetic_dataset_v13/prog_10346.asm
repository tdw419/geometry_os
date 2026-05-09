; DESCRIPTION: Composite: Places a orange circle of radius 70 at center (232, 140) then Places a magenta line segment connecting (439, 211) to (254, 1).
; PLAN: r0=232(x), r1=140(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x1), r6=211(y1), r7=254(x2), r8=1(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 140
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 211
LDI r7, 254
LDI r8, 1
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
