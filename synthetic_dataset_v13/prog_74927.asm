; DESCRIPTION: Places a green line segment connecting (150, 123) to (350, 190).
; PLAN: r0=150(x1), r1=123(y1), r2=350(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 123
LDI r2, 350
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
