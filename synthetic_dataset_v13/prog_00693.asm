; DESCRIPTION: Renders a magenta line between points (256, 36) and (378, 227).
; PLAN: r0=256(x1), r1=36(y1), r2=378(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 36
LDI r2, 378
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
