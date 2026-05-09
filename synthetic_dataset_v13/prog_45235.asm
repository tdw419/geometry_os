; DESCRIPTION: Draws a red line from (508, 223) to (360, 87).
; PLAN: r0=508(x1), r1=223(y1), r2=360(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 223
LDI r2, 360
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
