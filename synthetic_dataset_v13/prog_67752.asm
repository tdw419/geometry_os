; DESCRIPTION: Renders a white line between points (277, 225) and (353, 99).
; PLAN: r0=277(x1), r1=225(y1), r2=353(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 225
LDI r2, 353
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
