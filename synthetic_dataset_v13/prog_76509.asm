; DESCRIPTION: Draws a red line from (480, 33) to (236, 157).
; PLAN: r0=480(x1), r1=33(y1), r2=236(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 33
LDI r2, 236
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
