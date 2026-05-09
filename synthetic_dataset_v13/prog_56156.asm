; DESCRIPTION: Draws a yellow line from (474, 38) to (293, 110).
; PLAN: r0=474(x1), r1=38(y1), r2=293(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 38
LDI r2, 293
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
