; DESCRIPTION: Places a yellow line segment connecting (416, 113) to (154, 131).
; PLAN: r0=416(x1), r1=113(y1), r2=154(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 113
LDI r2, 154
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
