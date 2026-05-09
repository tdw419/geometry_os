; DESCRIPTION: Places a red line segment connecting (327, 140) to (3, 64).
; PLAN: r0=327(x1), r1=140(y1), r2=3(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 140
LDI r2, 3
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
