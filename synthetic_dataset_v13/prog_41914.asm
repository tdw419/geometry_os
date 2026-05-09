; DESCRIPTION: Renders a red line between points (128, 179) and (84, 219).
; PLAN: r0=128(x1), r1=179(y1), r2=84(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 179
LDI r2, 84
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
