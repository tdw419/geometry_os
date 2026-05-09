; DESCRIPTION: Renders a black line between points (96, 31) and (482, 135).
; PLAN: r0=96(x1), r1=31(y1), r2=482(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 31
LDI r2, 482
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
