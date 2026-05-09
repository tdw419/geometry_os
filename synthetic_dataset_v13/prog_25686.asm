; DESCRIPTION: Places a orange line segment connecting (126, 190) to (58, 37).
; PLAN: r0=126(x1), r1=190(y1), r2=58(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 190
LDI r2, 58
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
