; DESCRIPTION: Places a yellow line segment connecting (103, 127) to (219, 172).
; PLAN: r0=103(x1), r1=127(y1), r2=219(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 127
LDI r2, 219
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
