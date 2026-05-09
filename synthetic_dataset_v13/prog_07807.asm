; DESCRIPTION: Places a green line segment connecting (76, 10) to (227, 174).
; PLAN: r0=76(x1), r1=10(y1), r2=227(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 10
LDI r2, 227
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
