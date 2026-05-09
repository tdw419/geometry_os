; DESCRIPTION: Places a yellow line segment connecting (233, 3) to (464, 134).
; PLAN: r0=233(x1), r1=3(y1), r2=464(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 3
LDI r2, 464
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
