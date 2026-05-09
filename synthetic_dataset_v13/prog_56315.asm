; DESCRIPTION: Places a green line segment connecting (216, 186) to (237, 229).
; PLAN: r0=216(x1), r1=186(y1), r2=237(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 186
LDI r2, 237
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
