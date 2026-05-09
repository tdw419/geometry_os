; DESCRIPTION: Renders a magenta line between points (227, 45) and (454, 171).
; PLAN: r0=227(x1), r1=45(y1), r2=454(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 45
LDI r2, 454
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
