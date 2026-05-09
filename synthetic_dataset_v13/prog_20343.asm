; DESCRIPTION: Places a green line segment connecting (382, 48) to (34, 70).
; PLAN: r0=382(x1), r1=48(y1), r2=34(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 48
LDI r2, 34
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
