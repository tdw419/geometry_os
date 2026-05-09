; DESCRIPTION: Places a green line segment connecting (15, 164) to (123, 64).
; PLAN: r0=15(x1), r1=164(y1), r2=123(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 164
LDI r2, 123
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
