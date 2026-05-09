; DESCRIPTION: Places a red line segment connecting (430, 40) to (327, 63).
; PLAN: r0=430(x1), r1=40(y1), r2=327(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 40
LDI r2, 327
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
