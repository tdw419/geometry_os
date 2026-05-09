; DESCRIPTION: Draws a red line from (4, 77) to (83, 70).
; PLAN: r0=4(x1), r1=77(y1), r2=83(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 77
LDI r2, 83
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
