; DESCRIPTION: Creates a magenta circular shape at (146, 77) with radius 21.
; PLAN: r0=146(x), r1=77(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 77
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
