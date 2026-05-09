; DESCRIPTION: Places a yellow line segment connecting (402, 131) to (465, 134).
; PLAN: r0=402(x1), r1=131(y1), r2=465(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 131
LDI r2, 465
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
