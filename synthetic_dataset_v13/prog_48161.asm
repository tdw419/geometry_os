; DESCRIPTION: Draws a red line from (308, 100) to (271, 179).
; PLAN: r0=308(x1), r1=100(y1), r2=271(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 100
LDI r2, 271
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
