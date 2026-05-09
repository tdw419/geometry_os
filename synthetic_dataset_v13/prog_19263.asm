; DESCRIPTION: Draws a red line from (335, 88) to (69, 109).
; PLAN: r0=335(x1), r1=88(y1), r2=69(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 88
LDI r2, 69
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
