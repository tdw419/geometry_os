; DESCRIPTION: Creates a magenta circular shape at (202, 87) with radius 54.
; PLAN: r0=202(x), r1=87(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 87
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
