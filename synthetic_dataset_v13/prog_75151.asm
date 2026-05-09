; DESCRIPTION: Places a green line segment connecting (162, 230) to (261, 190).
; PLAN: r0=162(x1), r1=230(y1), r2=261(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 230
LDI r2, 261
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
