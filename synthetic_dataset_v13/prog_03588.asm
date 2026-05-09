; DESCRIPTION: Creates a blue circular shape at (370, 133) with radius 16.
; PLAN: r0=370(x), r1=133(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 133
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
