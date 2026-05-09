; DESCRIPTION: Creates a green circular shape at (242, 164) with radius 80.
; PLAN: r0=242(x), r1=164(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 164
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
