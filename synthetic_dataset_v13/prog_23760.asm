; DESCRIPTION: Composite: Sets a single orange pixel at (422, 172) then Places a white line segment connecting (100, 180) to (1, 103) then Places a orange circle of radius 63 at center (162, 125).
; PLAN: r0=422(x), r1=172(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=100(x1), r6=180(y1), r7=1(x2), r8=103(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=162(x), r11=125(y), r12=63(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 422
LDI r1, 172
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 100
LDI r6, 180
LDI r7, 1
LDI r8, 103
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 125
LDI r12, 63
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
