; DESCRIPTION: Places a yellow line segment connecting (61, 6) to (329, 21).
; PLAN: r0=61(x1), r1=6(y1), r2=329(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 6
LDI r2, 329
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
