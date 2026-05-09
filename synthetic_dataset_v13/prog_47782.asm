; DESCRIPTION: Renders a blue line between points (275, 238) and (245, 185).
; PLAN: r0=275(x1), r1=238(y1), r2=245(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 238
LDI r2, 245
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
