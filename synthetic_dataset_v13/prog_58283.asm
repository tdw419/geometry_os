; DESCRIPTION: Places a yellow line segment connecting (271, 66) to (115, 45).
; PLAN: r0=271(x1), r1=66(y1), r2=115(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 66
LDI r2, 115
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
