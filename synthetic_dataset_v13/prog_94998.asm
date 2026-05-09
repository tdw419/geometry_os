; DESCRIPTION: Places a yellow line segment connecting (329, 204) to (39, 2).
; PLAN: r0=329(x1), r1=204(y1), r2=39(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 204
LDI r2, 39
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
