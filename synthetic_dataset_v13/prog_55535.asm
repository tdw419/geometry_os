; DESCRIPTION: Creates a red circular shape at (366, 37) with radius 32.
; PLAN: r0=366(x), r1=37(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 37
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
