; DESCRIPTION: Draws a red line from (408, 86) to (454, 13).
; PLAN: r0=408(x1), r1=86(y1), r2=454(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 86
LDI r2, 454
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
