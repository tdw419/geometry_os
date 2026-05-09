; DESCRIPTION: Places a yellow circle of radius 71 at center (177, 128).
; PLAN: r0=177(x), r1=128(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 128
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
