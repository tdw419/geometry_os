; DESCRIPTION: Creates a orange circular shape at (242, 83) with radius 32.
; PLAN: r0=242(x), r1=83(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 83
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
