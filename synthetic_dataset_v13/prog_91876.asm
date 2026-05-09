; DESCRIPTION: Places a yellow line segment connecting (120, 86) to (143, 98).
; PLAN: r0=120(x1), r1=86(y1), r2=143(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 86
LDI r2, 143
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
