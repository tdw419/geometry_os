; DESCRIPTION: Creates a magenta circular shape at (215, 180) with radius 62.
; PLAN: r0=215(x), r1=180(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 180
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
