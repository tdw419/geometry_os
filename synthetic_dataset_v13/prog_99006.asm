; DESCRIPTION: Draws a red line from (87, 6) to (482, 145).
; PLAN: r0=87(x1), r1=6(y1), r2=482(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 6
LDI r2, 482
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
