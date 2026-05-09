; DESCRIPTION: Creates a yellow circular shape at (36, 242) with radius 13.
; PLAN: r0=36(x), r1=242(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 242
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
