; DESCRIPTION: Renders a magenta line between points (11, 136) and (350, 174).
; PLAN: r0=11(x1), r1=136(y1), r2=350(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 136
LDI r2, 350
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
