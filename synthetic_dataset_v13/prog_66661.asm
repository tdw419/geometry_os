; DESCRIPTION: Places a red line segment connecting (126, 117) to (437, 20).
; PLAN: r0=126(x1), r1=117(y1), r2=437(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 117
LDI r2, 437
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
