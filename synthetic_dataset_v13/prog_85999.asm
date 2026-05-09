; DESCRIPTION: Renders a magenta line between points (358, 56) and (444, 195).
; PLAN: r0=358(x1), r1=56(y1), r2=444(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 56
LDI r2, 444
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
