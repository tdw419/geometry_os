; DESCRIPTION: Places a black line segment connecting (415, 217) to (401, 117).
; PLAN: r0=415(x1), r1=217(y1), r2=401(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 217
LDI r2, 401
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
