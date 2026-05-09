; DESCRIPTION: Renders a magenta line between points (478, 33) and (362, 56).
; PLAN: r0=478(x1), r1=33(y1), r2=362(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 33
LDI r2, 362
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
