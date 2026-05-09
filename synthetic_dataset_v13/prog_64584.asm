; DESCRIPTION: Creates a magenta circular shape at (202, 84) with radius 77.
; PLAN: r0=202(x), r1=84(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 84
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
