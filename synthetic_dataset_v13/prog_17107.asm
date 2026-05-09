; DESCRIPTION: Places a red line segment connecting (424, 215) to (459, 39).
; PLAN: r0=424(x1), r1=215(y1), r2=459(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 215
LDI r2, 459
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
