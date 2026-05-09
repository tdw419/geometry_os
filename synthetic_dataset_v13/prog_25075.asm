; DESCRIPTION: Draws a red line from (123, 24) to (37, 206).
; PLAN: r0=123(x1), r1=24(y1), r2=37(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 24
LDI r2, 37
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
