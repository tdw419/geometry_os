; DESCRIPTION: Renders a magenta line between points (315, 208) and (151, 142).
; PLAN: r0=315(x1), r1=208(y1), r2=151(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 208
LDI r2, 151
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
