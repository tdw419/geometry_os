; DESCRIPTION: Renders a purple line between points (78, 43) and (168, 208).
; PLAN: r0=78(x1), r1=43(y1), r2=168(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 43
LDI r2, 168
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
