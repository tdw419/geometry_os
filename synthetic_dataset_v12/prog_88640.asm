; DESCRIPTION: Renders a white line between points (52, 216) and (382, 101).
; PLAN: r0=52(x1), r1=216(y1), r2=382(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 216
LDI r2, 382
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
