; DESCRIPTION: Renders a magenta line between points (474, 226) and (181, 167).
; PLAN: r0=474(x1), r1=226(y1), r2=181(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 226
LDI r2, 181
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
