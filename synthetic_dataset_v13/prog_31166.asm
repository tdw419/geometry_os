; DESCRIPTION: Places a green line segment connecting (317, 198) to (474, 10).
; PLAN: r0=317(x1), r1=198(y1), r2=474(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 198
LDI r2, 474
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
