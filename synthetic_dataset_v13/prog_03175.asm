; DESCRIPTION: Places a yellow line segment connecting (35, 206) to (33, 89).
; PLAN: r0=35(x1), r1=206(y1), r2=33(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 206
LDI r2, 33
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
