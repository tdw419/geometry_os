; DESCRIPTION: Renders a blue line between points (323, 97) and (45, 174).
; PLAN: r0=323(x1), r1=97(y1), r2=45(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 97
LDI r2, 45
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
