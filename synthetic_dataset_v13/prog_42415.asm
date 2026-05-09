; DESCRIPTION: Draws a red line from (85, 153) to (13, 128).
; PLAN: r0=85(x1), r1=153(y1), r2=13(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 153
LDI r2, 13
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
