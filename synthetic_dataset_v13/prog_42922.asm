; DESCRIPTION: Creates a magenta circular shape at (206, 180) with radius 69.
; PLAN: r0=206(x), r1=180(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 180
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
