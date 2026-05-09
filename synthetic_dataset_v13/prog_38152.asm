; DESCRIPTION: Places a yellow line segment connecting (307, 135) to (383, 87).
; PLAN: r0=307(x1), r1=135(y1), r2=383(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 135
LDI r2, 383
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
