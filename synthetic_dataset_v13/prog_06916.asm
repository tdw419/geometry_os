; DESCRIPTION: Renders a white line between points (170, 171) and (325, 142).
; PLAN: r0=170(x1), r1=171(y1), r2=325(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 171
LDI r2, 325
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
