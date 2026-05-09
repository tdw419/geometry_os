; DESCRIPTION: Composite: Sets a single magenta pixel at (444, 14) then Places a orange line segment connecting (308, 173) to (121, 6).
; PLAN: r0=444(x), r1=14(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=308(x1), r6=173(y1), r7=121(x2), r8=6(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 14
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 308
LDI r6, 173
LDI r7, 121
LDI r8, 6
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
