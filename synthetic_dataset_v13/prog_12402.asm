; DESCRIPTION: Creates a magenta circular shape at (328, 202) with radius 47.
; PLAN: r0=328(x), r1=202(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 202
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
