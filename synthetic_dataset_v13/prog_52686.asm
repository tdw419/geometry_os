; DESCRIPTION: Creates a magenta circular shape at (202, 152) with radius 60.
; PLAN: r0=202(x), r1=152(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 152
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
