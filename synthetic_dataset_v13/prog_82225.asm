; DESCRIPTION: Places a yellow line segment connecting (464, 78) to (133, 242).
; PLAN: r0=464(x1), r1=78(y1), r2=133(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 78
LDI r2, 133
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
