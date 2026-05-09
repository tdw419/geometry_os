; DESCRIPTION: Draws a white line from (404, 52) to (88, 162).
; PLAN: r0=404(x1), r1=52(y1), r2=88(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 52
LDI r2, 88
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
