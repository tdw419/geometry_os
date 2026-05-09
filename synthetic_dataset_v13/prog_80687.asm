; DESCRIPTION: Draws a red line from (21, 11) to (459, 200).
; PLAN: r0=21(x1), r1=11(y1), r2=459(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 11
LDI r2, 459
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
