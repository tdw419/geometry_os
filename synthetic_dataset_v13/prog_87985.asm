; DESCRIPTION: Places a magenta circle of radius 11 at center (276, 242).
; PLAN: r0=276(x), r1=242(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 242
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
