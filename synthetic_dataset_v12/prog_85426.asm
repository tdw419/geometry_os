; DESCRIPTION: Renders a blue line between points (509, 145) and (18, 38).
; PLAN: r0=509(x1), r1=145(y1), r2=18(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 145
LDI r2, 18
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
