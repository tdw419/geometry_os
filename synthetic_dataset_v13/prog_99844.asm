; DESCRIPTION: Renders a red line between points (185, 70) and (57, 128).
; PLAN: r0=185(x1), r1=70(y1), r2=57(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 70
LDI r2, 57
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
