; DESCRIPTION: Renders a blue line between points (19, 174) and (303, 126).
; PLAN: r0=19(x1), r1=174(y1), r2=303(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 174
LDI r2, 303
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
