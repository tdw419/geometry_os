; DESCRIPTION: Places a red line segment connecting (331, 116) to (39, 161).
; PLAN: r0=331(x1), r1=116(y1), r2=39(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 116
LDI r2, 39
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
