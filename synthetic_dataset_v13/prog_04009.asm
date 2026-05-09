; DESCRIPTION: Places a red line segment connecting (344, 90) to (401, 51).
; PLAN: r0=344(x1), r1=90(y1), r2=401(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 90
LDI r2, 401
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
