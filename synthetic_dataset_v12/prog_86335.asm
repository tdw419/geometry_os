; DESCRIPTION: Creates a blue circular shape at (91, 111) with radius 80.
; PLAN: r0=91(x), r1=111(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 111
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
