; DESCRIPTION: Draws a red line from (360, 65) to (483, 250).
; PLAN: r0=360(x1), r1=65(y1), r2=483(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 65
LDI r2, 483
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
