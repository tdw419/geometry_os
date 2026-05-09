; DESCRIPTION: Places a red circle of radius 15 at center (468, 220).
; PLAN: r0=468(x), r1=220(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 220
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
