; DESCRIPTION: Places a orange line segment connecting (309, 129) to (477, 248).
; PLAN: r0=309(x1), r1=129(y1), r2=477(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 129
LDI r2, 477
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
