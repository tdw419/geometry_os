; DESCRIPTION: Renders a magenta line between points (304, 243) and (227, 226).
; PLAN: r0=304(x1), r1=243(y1), r2=227(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 243
LDI r2, 227
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
