; DESCRIPTION: Places a green line segment connecting (452, 28) to (366, 210).
; PLAN: r0=452(x1), r1=28(y1), r2=366(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 28
LDI r2, 366
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
