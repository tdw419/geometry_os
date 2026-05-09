; DESCRIPTION: Renders a blue line between points (44, 107) and (56, 171).
; PLAN: r0=44(x1), r1=107(y1), r2=56(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 107
LDI r2, 56
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
