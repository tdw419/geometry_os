; DESCRIPTION: Draws a red line from (78, 48) to (152, 185).
; PLAN: r0=78(x1), r1=48(y1), r2=152(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 48
LDI r2, 152
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
