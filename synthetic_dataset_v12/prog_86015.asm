; DESCRIPTION: Places a green line segment connecting (357, 113) to (216, 186).
; PLAN: r0=357(x1), r1=113(y1), r2=216(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 113
LDI r2, 216
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
