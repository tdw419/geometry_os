; DESCRIPTION: Places a blue line segment connecting (245, 34) to (386, 62).
; PLAN: r0=245(x1), r1=34(y1), r2=386(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 34
LDI r2, 386
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
