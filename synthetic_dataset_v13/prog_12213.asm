; DESCRIPTION: Creates a magenta circular shape at (423, 154) with radius 20.
; PLAN: r0=423(x), r1=154(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 154
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
