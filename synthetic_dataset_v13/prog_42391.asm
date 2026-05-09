; DESCRIPTION: Places a magenta circle of radius 66 at center (273, 143).
; PLAN: r0=273(x), r1=143(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 143
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
