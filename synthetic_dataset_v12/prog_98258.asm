; DESCRIPTION: Draws a red line from (214, 139) to (500, 234).
; PLAN: r0=214(x1), r1=139(y1), r2=500(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 139
LDI r2, 500
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
