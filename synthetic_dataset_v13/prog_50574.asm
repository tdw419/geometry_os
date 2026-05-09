; DESCRIPTION: Creates a blue circular shape at (474, 146) with radius 12.
; PLAN: r0=474(x), r1=146(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 146
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
