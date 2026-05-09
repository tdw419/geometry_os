; DESCRIPTION: Creates a magenta circular shape at (437, 210) with radius 27.
; PLAN: r0=437(x), r1=210(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 210
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
