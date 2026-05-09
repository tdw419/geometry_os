; DESCRIPTION: Renders a black line between points (353, 230) and (439, 40).
; PLAN: r0=353(x1), r1=230(y1), r2=439(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 230
LDI r2, 439
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
