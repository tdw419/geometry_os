; DESCRIPTION: Creates a blue circular shape at (187, 164) with radius 80.
; PLAN: r0=187(x), r1=164(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 164
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
