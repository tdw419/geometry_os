; DESCRIPTION: Places a green line segment connecting (106, 248) to (47, 212).
; PLAN: r0=106(x1), r1=248(y1), r2=47(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 248
LDI r2, 47
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
