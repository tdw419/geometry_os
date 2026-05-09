; DESCRIPTION: Creates a magenta circular shape at (479, 124) with radius 12.
; PLAN: r0=479(x), r1=124(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 124
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
