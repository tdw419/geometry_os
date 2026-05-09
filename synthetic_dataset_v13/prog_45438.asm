; DESCRIPTION: Renders a black line between points (269, 1) and (278, 7).
; PLAN: r0=269(x1), r1=1(y1), r2=278(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 1
LDI r2, 278
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
