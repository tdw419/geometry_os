; DESCRIPTION: Places a magenta circle of radius 42 at center (349, 91).
; PLAN: r0=349(x), r1=91(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 91
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
