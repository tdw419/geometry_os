; DESCRIPTION: Places a white line segment connecting (175, 121) to (31, 51).
; PLAN: r0=175(x1), r1=121(y1), r2=31(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 121
LDI r2, 31
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
