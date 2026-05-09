; DESCRIPTION: Draws a cyan line from (201, 34) to (95, 136).
; PLAN: r0=201(x1), r1=34(y1), r2=95(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 34
LDI r2, 95
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
