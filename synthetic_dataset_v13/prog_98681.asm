; DESCRIPTION: Creates a magenta circular shape at (260, 127) with radius 57.
; PLAN: r0=260(x), r1=127(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 127
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
