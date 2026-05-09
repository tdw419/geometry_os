; DESCRIPTION: Creates a blue circular shape at (249, 146) with radius 38.
; PLAN: r0=249(x), r1=146(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 146
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
