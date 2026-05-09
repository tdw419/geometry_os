; DESCRIPTION: Draws a red line from (500, 185) to (413, 87).
; PLAN: r0=500(x1), r1=185(y1), r2=413(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 185
LDI r2, 413
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
