; DESCRIPTION: Renders a black line between points (36, 135) and (482, 15).
; PLAN: r0=36(x1), r1=135(y1), r2=482(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 135
LDI r2, 482
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
