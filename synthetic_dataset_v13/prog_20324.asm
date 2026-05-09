; DESCRIPTION: Renders a blue line between points (196, 12) and (462, 108).
; PLAN: r0=196(x1), r1=12(y1), r2=462(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 12
LDI r2, 462
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
