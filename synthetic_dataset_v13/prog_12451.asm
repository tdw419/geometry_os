; DESCRIPTION: Places a white line segment connecting (408, 1) to (307, 189).
; PLAN: r0=408(x1), r1=1(y1), r2=307(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 1
LDI r2, 307
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
