; DESCRIPTION: Draws a red line from (6, 59) to (174, 218).
; PLAN: r0=6(x1), r1=59(y1), r2=174(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 59
LDI r2, 174
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
