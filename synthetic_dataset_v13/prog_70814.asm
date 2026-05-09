; DESCRIPTION: Places a red line segment connecting (47, 134) to (252, 215).
; PLAN: r0=47(x1), r1=134(y1), r2=252(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 134
LDI r2, 252
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
