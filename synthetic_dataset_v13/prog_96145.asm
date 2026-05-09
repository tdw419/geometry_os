; DESCRIPTION: Composite: Sets a single red pixel at (275, 253) then Places a orange line segment connecting (173, 174) to (187, 2).
; PLAN: r0=275(x), r1=253(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=173(x1), r6=174(y1), r7=187(x2), r8=2(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 253
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 173
LDI r6, 174
LDI r7, 187
LDI r8, 2
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
