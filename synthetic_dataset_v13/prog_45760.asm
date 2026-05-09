; DESCRIPTION: Creates a magenta circular shape at (69, 180) with radius 27.
; PLAN: r0=69(x), r1=180(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 180
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
