; DESCRIPTION: Places a magenta circle of radius 60 at center (311, 111).
; PLAN: r0=311(x), r1=111(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 111
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
