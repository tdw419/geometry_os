; DESCRIPTION: Renders a magenta line between points (303, 199) and (499, 142).
; PLAN: r0=303(x1), r1=199(y1), r2=499(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 199
LDI r2, 499
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
