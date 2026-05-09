; DESCRIPTION: Places a white line segment connecting (116, 186) to (469, 216).
; PLAN: r0=116(x1), r1=186(y1), r2=469(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 186
LDI r2, 469
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
