; DESCRIPTION: Places a black line segment connecting (306, 137) to (262, 29).
; PLAN: r0=306(x1), r1=137(y1), r2=262(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 137
LDI r2, 262
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
