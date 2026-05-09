; DESCRIPTION: Places a red line segment connecting (326, 159) to (273, 234).
; PLAN: r0=326(x1), r1=159(y1), r2=273(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 159
LDI r2, 273
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
