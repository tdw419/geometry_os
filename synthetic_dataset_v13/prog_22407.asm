; DESCRIPTION: Places a red line segment connecting (43, 236) to (288, 203).
; PLAN: r0=43(x1), r1=236(y1), r2=288(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 236
LDI r2, 288
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
