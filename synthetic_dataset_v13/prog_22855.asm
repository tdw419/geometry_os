; DESCRIPTION: Draws a red line from (227, 7) to (328, 110).
; PLAN: r0=227(x1), r1=7(y1), r2=328(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 7
LDI r2, 328
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
