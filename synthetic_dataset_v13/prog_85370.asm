; DESCRIPTION: Places a green line segment connecting (448, 153) to (465, 108).
; PLAN: r0=448(x1), r1=153(y1), r2=465(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 153
LDI r2, 465
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
