; DESCRIPTION: Places a green line segment connecting (196, 28) to (341, 172).
; PLAN: r0=196(x1), r1=28(y1), r2=341(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 28
LDI r2, 341
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
