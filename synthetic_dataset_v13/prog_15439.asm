; DESCRIPTION: Renders a blue line between points (491, 106) and (275, 243).
; PLAN: r0=491(x1), r1=106(y1), r2=275(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 106
LDI r2, 275
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
