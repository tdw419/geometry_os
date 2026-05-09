; DESCRIPTION: Places a blue line segment connecting (449, 39) to (236, 128).
; PLAN: r0=449(x1), r1=39(y1), r2=236(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 39
LDI r2, 236
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
