; DESCRIPTION: Draws a cyan line from (259, 153) to (155, 133).
; PLAN: r0=259(x1), r1=153(y1), r2=155(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 153
LDI r2, 155
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
