; DESCRIPTION: Renders a magenta line between points (5, 178) and (382, 189).
; PLAN: r0=5(x1), r1=178(y1), r2=382(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 178
LDI r2, 382
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
