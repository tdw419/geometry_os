; DESCRIPTION: Draws a red line from (206, 150) to (133, 72).
; PLAN: r0=206(x1), r1=150(y1), r2=133(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 150
LDI r2, 133
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
