; DESCRIPTION: Creates a magenta circular shape at (432, 134) with radius 27.
; PLAN: r0=432(x), r1=134(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 134
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
