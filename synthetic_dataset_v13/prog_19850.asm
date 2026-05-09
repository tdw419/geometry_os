; DESCRIPTION: Places a white line segment connecting (131, 233) to (263, 25).
; PLAN: r0=131(x1), r1=233(y1), r2=263(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 233
LDI r2, 263
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
