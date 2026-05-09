; DESCRIPTION: Renders a white line between points (424, 107) and (416, 142).
; PLAN: r0=424(x1), r1=107(y1), r2=416(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 107
LDI r2, 416
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
