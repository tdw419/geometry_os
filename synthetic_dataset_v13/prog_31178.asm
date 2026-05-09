; DESCRIPTION: Renders a black line between points (269, 220) and (508, 20).
; PLAN: r0=269(x1), r1=220(y1), r2=508(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 220
LDI r2, 508
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
