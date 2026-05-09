; DESCRIPTION: Draws a red line from (413, 41) to (243, 106).
; PLAN: r0=413(x1), r1=41(y1), r2=243(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 41
LDI r2, 243
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
