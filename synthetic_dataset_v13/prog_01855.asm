; DESCRIPTION: Renders a black line between points (499, 20) and (388, 54).
; PLAN: r0=499(x1), r1=20(y1), r2=388(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 20
LDI r2, 388
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
