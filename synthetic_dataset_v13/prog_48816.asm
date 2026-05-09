; DESCRIPTION: Creates a magenta circular shape at (292, 126) with radius 58.
; PLAN: r0=292(x), r1=126(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 126
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
