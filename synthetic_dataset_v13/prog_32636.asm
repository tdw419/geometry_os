; DESCRIPTION: Creates a magenta circular shape at (439, 197) with radius 58.
; PLAN: r0=439(x), r1=197(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 197
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
