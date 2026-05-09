; DESCRIPTION: Draws a red line from (270, 35) to (361, 218).
; PLAN: r0=270(x1), r1=35(y1), r2=361(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 35
LDI r2, 361
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
