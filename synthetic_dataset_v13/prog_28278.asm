; DESCRIPTION: Places a red line segment connecting (448, 53) to (188, 113).
; PLAN: r0=448(x1), r1=53(y1), r2=188(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 53
LDI r2, 188
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
