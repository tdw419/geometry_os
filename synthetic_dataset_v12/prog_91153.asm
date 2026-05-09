; DESCRIPTION: Renders a white line between points (472, 107) and (331, 96).
; PLAN: r0=472(x1), r1=107(y1), r2=331(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 107
LDI r2, 331
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
