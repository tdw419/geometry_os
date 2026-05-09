; DESCRIPTION: Places a yellow line segment connecting (397, 0) to (375, 190).
; PLAN: r0=397(x1), r1=0(y1), r2=375(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 0
LDI r2, 375
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
