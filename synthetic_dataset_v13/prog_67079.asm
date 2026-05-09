; DESCRIPTION: Places a red line segment connecting (276, 199) to (65, 212).
; PLAN: r0=276(x1), r1=199(y1), r2=65(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 199
LDI r2, 65
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
