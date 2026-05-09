; DESCRIPTION: Draws a cyan line from (72, 26) to (369, 133).
; PLAN: r0=72(x1), r1=26(y1), r2=369(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 26
LDI r2, 369
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
