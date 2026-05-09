; DESCRIPTION: Places a yellow line segment connecting (70, 106) to (113, 197).
; PLAN: r0=70(x1), r1=106(y1), r2=113(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 106
LDI r2, 113
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
