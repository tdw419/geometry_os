; DESCRIPTION: Renders a magenta line between points (127, 222) and (358, 232).
; PLAN: r0=127(x1), r1=222(y1), r2=358(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 222
LDI r2, 358
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
