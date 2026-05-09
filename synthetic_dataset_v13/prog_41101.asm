; DESCRIPTION: Places a red circle of radius 32 at center (239, 65).
; PLAN: r0=239(x), r1=65(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 65
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
