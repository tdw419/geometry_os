; DESCRIPTION: Draws a yellow line from (308, 121) to (474, 35).
; PLAN: r0=308(x1), r1=121(y1), r2=474(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 121
LDI r2, 474
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
