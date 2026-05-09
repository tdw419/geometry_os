; DESCRIPTION: Renders a black line between points (277, 184) and (75, 70).
; PLAN: r0=277(x1), r1=184(y1), r2=75(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 184
LDI r2, 75
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
