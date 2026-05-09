; DESCRIPTION: Places a white line segment connecting (229, 10) to (309, 85).
; PLAN: r0=229(x1), r1=10(y1), r2=309(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 10
LDI r2, 309
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
