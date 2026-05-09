; DESCRIPTION: Creates a magenta circular shape at (168, 235) with radius 16.
; PLAN: r0=168(x), r1=235(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 235
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
