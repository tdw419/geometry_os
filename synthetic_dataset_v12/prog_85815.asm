; DESCRIPTION: Places a red circle of radius 64 at center (407, 192).
; PLAN: r0=407(x), r1=192(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 192
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
