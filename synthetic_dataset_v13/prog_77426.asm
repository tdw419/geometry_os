; DESCRIPTION: Places a orange line segment connecting (465, 139) to (237, 159).
; PLAN: r0=465(x1), r1=139(y1), r2=237(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 139
LDI r2, 237
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
