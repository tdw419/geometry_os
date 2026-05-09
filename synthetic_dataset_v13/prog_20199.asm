; DESCRIPTION: Places a purple line segment connecting (259, 161) to (106, 215).
; PLAN: r0=259(x1), r1=161(y1), r2=106(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 161
LDI r2, 106
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
