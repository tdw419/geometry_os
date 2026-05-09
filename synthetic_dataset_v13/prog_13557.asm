; DESCRIPTION: Renders a green line between points (357, 131) and (218, 170).
; PLAN: r0=357(x1), r1=131(y1), r2=218(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 131
LDI r2, 218
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
