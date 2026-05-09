; DESCRIPTION: Renders a red line between points (219, 162) and (135, 21).
; PLAN: r0=219(x1), r1=162(y1), r2=135(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 162
LDI r2, 135
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
