; DESCRIPTION: Places a magenta line segment connecting (273, 1) to (438, 41).
; PLAN: r0=273(x1), r1=1(y1), r2=438(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 1
LDI r2, 438
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
