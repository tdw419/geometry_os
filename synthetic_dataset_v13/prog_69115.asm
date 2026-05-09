; DESCRIPTION: Places a yellow line segment connecting (5, 121) to (255, 199).
; PLAN: r0=5(x1), r1=121(y1), r2=255(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 121
LDI r2, 255
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
