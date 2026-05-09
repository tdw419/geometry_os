; DESCRIPTION: Places a red line segment connecting (217, 6) to (292, 206).
; PLAN: r0=217(x1), r1=6(y1), r2=292(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 6
LDI r2, 292
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
