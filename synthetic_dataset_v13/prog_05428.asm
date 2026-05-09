; DESCRIPTION: Renders a black line between points (260, 198) and (317, 250).
; PLAN: r0=260(x1), r1=198(y1), r2=317(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 198
LDI r2, 317
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
