; DESCRIPTION: Places a red circle of radius 22 at center (468, 135).
; PLAN: r0=468(x), r1=135(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 135
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
