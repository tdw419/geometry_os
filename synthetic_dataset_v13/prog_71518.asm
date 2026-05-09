; DESCRIPTION: Places a yellow line segment connecting (159, 60) to (245, 32).
; PLAN: r0=159(x1), r1=60(y1), r2=245(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 60
LDI r2, 245
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
