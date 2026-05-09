; DESCRIPTION: Renders a white line between points (418, 217) and (30, 186).
; PLAN: r0=418(x1), r1=217(y1), r2=30(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 217
LDI r2, 30
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
