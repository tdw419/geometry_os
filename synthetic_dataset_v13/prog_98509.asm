; DESCRIPTION: Places a green line segment connecting (231, 34) to (223, 32).
; PLAN: r0=231(x1), r1=34(y1), r2=223(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 34
LDI r2, 223
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
