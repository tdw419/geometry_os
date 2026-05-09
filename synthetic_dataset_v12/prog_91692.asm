; DESCRIPTION: Creates a cyan circular shape at (413, 129) with radius 41.
; PLAN: r0=413(x), r1=129(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 129
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
