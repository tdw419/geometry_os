; DESCRIPTION: Creates a cyan circular shape at (274, 129) with radius 56.
; PLAN: r0=274(x), r1=129(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 129
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
