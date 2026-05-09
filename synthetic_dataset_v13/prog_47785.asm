; DESCRIPTION: Draws a cyan line from (133, 70) to (369, 212).
; PLAN: r0=133(x1), r1=70(y1), r2=369(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 70
LDI r2, 369
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
