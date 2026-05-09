; DESCRIPTION: Places a red line segment connecting (253, 95) to (262, 10).
; PLAN: r0=253(x1), r1=95(y1), r2=262(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 95
LDI r2, 262
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
