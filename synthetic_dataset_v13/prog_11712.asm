; DESCRIPTION: Places a white line segment connecting (1, 51) to (263, 74).
; PLAN: r0=1(x1), r1=51(y1), r2=263(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 51
LDI r2, 263
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
