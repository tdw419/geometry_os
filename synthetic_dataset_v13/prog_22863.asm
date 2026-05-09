; DESCRIPTION: Creates a magenta circular shape at (446, 111) with radius 50.
; PLAN: r0=446(x), r1=111(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 111
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
