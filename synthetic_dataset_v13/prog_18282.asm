; DESCRIPTION: Composite: Places a orange dot at position (97, 219) then Renders a orange line between points (200, 28) and (121, 96).
; PLAN: r0=97(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=200(x1), r6=28(y1), r7=121(x2), r8=96(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 200
LDI r6, 28
LDI r7, 121
LDI r8, 96
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
