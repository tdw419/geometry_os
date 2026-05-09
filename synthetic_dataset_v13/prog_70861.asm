; DESCRIPTION: Places a magenta circle of radius 10 at center (178, 242).
; PLAN: r0=178(x), r1=242(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 242
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
