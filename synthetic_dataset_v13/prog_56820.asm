; DESCRIPTION: Renders a white line between points (390, 100) and (330, 208).
; PLAN: r0=390(x1), r1=100(y1), r2=330(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 100
LDI r2, 330
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
