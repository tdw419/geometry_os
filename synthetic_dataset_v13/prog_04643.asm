; DESCRIPTION: Places a red circle of radius 47 at center (364, 64).
; PLAN: r0=364(x), r1=64(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 64
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
