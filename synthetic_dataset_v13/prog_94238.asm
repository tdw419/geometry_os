; DESCRIPTION: Places a white line segment connecting (38, 23) to (307, 25).
; PLAN: r0=38(x1), r1=23(y1), r2=307(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 23
LDI r2, 307
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
