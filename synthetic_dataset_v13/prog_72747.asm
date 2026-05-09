; DESCRIPTION: Draws a red line from (288, 244) to (402, 58).
; PLAN: r0=288(x1), r1=244(y1), r2=402(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 244
LDI r2, 402
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
