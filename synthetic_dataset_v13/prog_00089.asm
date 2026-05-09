; DESCRIPTION: Draws a red line from (415, 34) to (418, 9).
; PLAN: r0=415(x1), r1=34(y1), r2=418(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 34
LDI r2, 418
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
