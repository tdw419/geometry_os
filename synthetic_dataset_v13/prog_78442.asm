; DESCRIPTION: Draws a red line from (500, 18) to (352, 133).
; PLAN: r0=500(x1), r1=18(y1), r2=352(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 18
LDI r2, 352
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
