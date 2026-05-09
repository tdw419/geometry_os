; DESCRIPTION: Draws a red line from (110, 32) to (408, 90).
; PLAN: r0=110(x1), r1=32(y1), r2=408(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 32
LDI r2, 408
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
