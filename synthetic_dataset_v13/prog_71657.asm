; DESCRIPTION: Draws a red line from (360, 10) to (371, 245).
; PLAN: r0=360(x1), r1=10(y1), r2=371(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 10
LDI r2, 371
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
