; DESCRIPTION: Renders a blue line between points (92, 234) and (252, 247).
; PLAN: r0=92(x1), r1=234(y1), r2=252(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 234
LDI r2, 252
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
