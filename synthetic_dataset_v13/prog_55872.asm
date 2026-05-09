; DESCRIPTION: Places a green line segment connecting (475, 164) to (381, 196).
; PLAN: r0=475(x1), r1=164(y1), r2=381(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 164
LDI r2, 381
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
