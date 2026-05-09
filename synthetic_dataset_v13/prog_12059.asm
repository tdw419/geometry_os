; DESCRIPTION: Places a yellow line segment connecting (300, 21) to (139, 113).
; PLAN: r0=300(x1), r1=21(y1), r2=139(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 21
LDI r2, 139
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
