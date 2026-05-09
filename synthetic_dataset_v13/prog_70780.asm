; DESCRIPTION: Places a yellow line segment connecting (18, 57) to (103, 6).
; PLAN: r0=18(x1), r1=57(y1), r2=103(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 57
LDI r2, 103
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
