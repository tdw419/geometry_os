; DESCRIPTION: Draws a red line from (203, 85) to (270, 243).
; PLAN: r0=203(x1), r1=85(y1), r2=270(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 85
LDI r2, 270
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
