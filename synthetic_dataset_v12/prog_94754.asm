; DESCRIPTION: Draws a red line from (130, 185) to (70, 184).
; PLAN: r0=130(x1), r1=185(y1), r2=70(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 185
LDI r2, 70
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
