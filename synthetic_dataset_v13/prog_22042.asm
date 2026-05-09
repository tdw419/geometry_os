; DESCRIPTION: Renders a black line between points (196, 243) and (238, 194).
; PLAN: r0=196(x1), r1=243(y1), r2=238(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 243
LDI r2, 238
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
