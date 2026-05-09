; DESCRIPTION: Creates a magenta circular shape at (191, 146) with radius 49.
; PLAN: r0=191(x), r1=146(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 146
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
