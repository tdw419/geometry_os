; DESCRIPTION: Renders a magenta line between points (494, 167) and (157, 206).
; PLAN: r0=494(x1), r1=167(y1), r2=157(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 167
LDI r2, 157
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
