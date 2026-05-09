; DESCRIPTION: Places a yellow line segment connecting (238, 179) to (350, 150).
; PLAN: r0=238(x1), r1=179(y1), r2=350(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 179
LDI r2, 350
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
