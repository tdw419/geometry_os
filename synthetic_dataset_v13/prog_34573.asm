; DESCRIPTION: Places a white line segment connecting (182, 104) to (173, 216).
; PLAN: r0=182(x1), r1=104(y1), r2=173(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 104
LDI r2, 173
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
