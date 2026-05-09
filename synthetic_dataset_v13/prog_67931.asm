; DESCRIPTION: Composite: Sets a single yellow pixel at (303, 19) then Renders a orange line between points (299, 122) and (193, 56).
; PLAN: r0=303(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=299(x1), r6=122(y1), r7=193(x2), r8=56(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 299
LDI r6, 122
LDI r7, 193
LDI r8, 56
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
