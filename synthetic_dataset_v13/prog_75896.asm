; DESCRIPTION: Creates a magenta circular shape at (180, 55) with radius 50.
; PLAN: r0=180(x), r1=55(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 55
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
