; DESCRIPTION: Places a white line segment connecting (458, 106) to (68, 32).
; PLAN: r0=458(x1), r1=106(y1), r2=68(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 106
LDI r2, 68
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
