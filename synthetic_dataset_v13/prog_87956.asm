; DESCRIPTION: Renders a red line between points (468, 134) and (64, 179).
; PLAN: r0=468(x1), r1=134(y1), r2=64(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 134
LDI r2, 64
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
