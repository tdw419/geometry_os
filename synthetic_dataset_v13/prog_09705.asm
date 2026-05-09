; DESCRIPTION: Renders a black line between points (277, 148) and (507, 37).
; PLAN: r0=277(x1), r1=148(y1), r2=507(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 148
LDI r2, 507
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
