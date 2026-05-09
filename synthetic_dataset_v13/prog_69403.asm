; DESCRIPTION: Places a red line segment connecting (94, 70) to (196, 248).
; PLAN: r0=94(x1), r1=70(y1), r2=196(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 70
LDI r2, 196
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
