; DESCRIPTION: Creates a cyan circular shape at (169, 129) with radius 53.
; PLAN: r0=169(x), r1=129(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 129
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
