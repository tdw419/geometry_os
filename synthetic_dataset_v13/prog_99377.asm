; DESCRIPTION: Renders a black line between points (473, 233) and (277, 232).
; PLAN: r0=473(x1), r1=233(y1), r2=277(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 233
LDI r2, 277
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
