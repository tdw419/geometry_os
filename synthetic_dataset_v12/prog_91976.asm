; DESCRIPTION: Composite: Places a white dot at position (466, 247) then Places a orange line segment connecting (78, 115) to (393, 168).
; PLAN: r0=466(x), r1=247(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=78(x1), r6=115(y1), r7=393(x2), r8=168(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 247
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 115
LDI r7, 393
LDI r8, 168
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
