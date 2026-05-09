; DESCRIPTION: Renders a magenta line between points (97, 59) and (146, 136).
; PLAN: r0=97(x1), r1=59(y1), r2=146(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 59
LDI r2, 146
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
