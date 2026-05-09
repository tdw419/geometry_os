; DESCRIPTION: Places a white line segment connecting (486, 198) to (64, 182).
; PLAN: r0=486(x1), r1=198(y1), r2=64(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 198
LDI r2, 64
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
