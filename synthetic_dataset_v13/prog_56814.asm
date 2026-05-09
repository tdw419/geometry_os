; DESCRIPTION: Places a black line segment connecting (307, 125) to (64, 108).
; PLAN: r0=307(x1), r1=125(y1), r2=64(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 125
LDI r2, 64
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
