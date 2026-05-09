; DESCRIPTION: Places a yellow line segment connecting (9, 181) to (5, 164).
; PLAN: r0=9(x1), r1=181(y1), r2=5(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 181
LDI r2, 5
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
