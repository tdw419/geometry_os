; DESCRIPTION: Places a magenta circle of radius 42 at center (439, 190).
; PLAN: r0=439(x), r1=190(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 190
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
