; DESCRIPTION: Creates a magenta circular shape at (464, 124) with radius 47.
; PLAN: r0=464(x), r1=124(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 124
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
