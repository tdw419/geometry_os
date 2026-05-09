; DESCRIPTION: Draws a red line from (266, 5) to (453, 244).
; PLAN: r0=266(x1), r1=5(y1), r2=453(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 5
LDI r2, 453
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
