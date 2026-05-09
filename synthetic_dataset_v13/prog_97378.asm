; DESCRIPTION: Places a magenta circle of radius 42 at center (365, 126).
; PLAN: r0=365(x), r1=126(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 126
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
