; DESCRIPTION: Draws a red line from (69, 207) to (353, 90).
; PLAN: r0=69(x1), r1=207(y1), r2=353(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 207
LDI r2, 353
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
