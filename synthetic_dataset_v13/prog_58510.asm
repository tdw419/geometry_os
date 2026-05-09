; DESCRIPTION: Places a magenta circle of radius 57 at center (61, 111).
; PLAN: r0=61(x), r1=111(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 111
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
