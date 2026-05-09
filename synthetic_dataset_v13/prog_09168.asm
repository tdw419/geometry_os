; DESCRIPTION: Renders a black line between points (435, 148) and (362, 10).
; PLAN: r0=435(x1), r1=148(y1), r2=362(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 148
LDI r2, 362
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
