; DESCRIPTION: Places a yellow line segment connecting (415, 127) to (81, 9).
; PLAN: r0=415(x1), r1=127(y1), r2=81(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 127
LDI r2, 81
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
