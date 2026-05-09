; DESCRIPTION: Places a white line segment connecting (463, 111) to (84, 9).
; PLAN: r0=463(x1), r1=111(y1), r2=84(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 111
LDI r2, 84
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
