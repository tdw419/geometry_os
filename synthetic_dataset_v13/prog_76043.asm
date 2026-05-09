; DESCRIPTION: Draws a green line from (474, 110) to (306, 184).
; PLAN: r0=474(x1), r1=110(y1), r2=306(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 110
LDI r2, 306
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
