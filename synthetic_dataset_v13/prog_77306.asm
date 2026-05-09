; DESCRIPTION: Draws a red line from (299, 145) to (206, 102).
; PLAN: r0=299(x1), r1=145(y1), r2=206(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 145
LDI r2, 206
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
