; DESCRIPTION: Renders a magenta line between points (127, 140) and (77, 204).
; PLAN: r0=127(x1), r1=140(y1), r2=77(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 140
LDI r2, 77
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
