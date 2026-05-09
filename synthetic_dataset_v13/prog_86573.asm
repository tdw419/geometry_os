; DESCRIPTION: Draws a red line from (30, 244) to (221, 4).
; PLAN: r0=30(x1), r1=244(y1), r2=221(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 244
LDI r2, 221
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
