; DESCRIPTION: Renders a black line between points (338, 48) and (20, 162).
; PLAN: r0=338(x1), r1=48(y1), r2=20(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 48
LDI r2, 20
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
