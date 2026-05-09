; DESCRIPTION: Places a red circle of radius 36 at center (49, 56).
; PLAN: r0=49(x), r1=56(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 56
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
