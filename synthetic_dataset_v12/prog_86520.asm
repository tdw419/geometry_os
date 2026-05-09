; DESCRIPTION: Renders a blue line between points (177, 174) and (29, 174).
; PLAN: r0=177(x1), r1=174(y1), r2=29(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 174
LDI r2, 29
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
