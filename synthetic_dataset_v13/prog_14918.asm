; DESCRIPTION: Renders a magenta line between points (355, 233) and (195, 103).
; PLAN: r0=355(x1), r1=233(y1), r2=195(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 233
LDI r2, 195
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
