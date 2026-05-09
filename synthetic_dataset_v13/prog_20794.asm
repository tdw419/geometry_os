; DESCRIPTION: Places a yellow line segment connecting (509, 86) to (300, 0).
; PLAN: r0=509(x1), r1=86(y1), r2=300(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 86
LDI r2, 300
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
