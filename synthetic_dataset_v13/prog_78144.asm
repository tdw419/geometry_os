; DESCRIPTION: Renders a magenta line between points (325, 125) and (213, 102).
; PLAN: r0=325(x1), r1=125(y1), r2=213(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 125
LDI r2, 213
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
