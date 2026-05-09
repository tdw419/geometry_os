; DESCRIPTION: Renders a blue line between points (262, 102) and (499, 243).
; PLAN: r0=262(x1), r1=102(y1), r2=499(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 102
LDI r2, 499
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
