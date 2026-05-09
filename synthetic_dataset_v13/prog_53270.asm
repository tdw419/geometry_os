; DESCRIPTION: Places a green line segment connecting (447, 202) to (325, 132).
; PLAN: r0=447(x1), r1=202(y1), r2=325(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 202
LDI r2, 325
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
