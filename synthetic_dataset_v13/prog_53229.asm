; DESCRIPTION: Places a red line segment connecting (70, 31) to (482, 252).
; PLAN: r0=70(x1), r1=31(y1), r2=482(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 31
LDI r2, 482
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
