; DESCRIPTION: Places a yellow line segment connecting (11, 33) to (276, 223).
; PLAN: r0=11(x1), r1=33(y1), r2=276(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 33
LDI r2, 276
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
