; DESCRIPTION: Renders a red line between points (4, 253) and (135, 219).
; PLAN: r0=4(x1), r1=253(y1), r2=135(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 253
LDI r2, 135
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
