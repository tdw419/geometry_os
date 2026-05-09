; DESCRIPTION: Renders a blue line between points (338, 61) and (357, 50).
; PLAN: r0=338(x1), r1=61(y1), r2=357(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 61
LDI r2, 357
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
