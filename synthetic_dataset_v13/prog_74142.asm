; DESCRIPTION: Places a red circle of radius 48 at center (304, 190).
; PLAN: r0=304(x), r1=190(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 190
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
