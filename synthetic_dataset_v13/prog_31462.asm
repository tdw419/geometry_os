; DESCRIPTION: Renders a white line between points (382, 196) and (486, 122).
; PLAN: r0=382(x1), r1=196(y1), r2=486(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 196
LDI r2, 486
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
