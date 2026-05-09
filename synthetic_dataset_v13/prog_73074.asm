; DESCRIPTION: Creates a cyan circular shape at (302, 129) with radius 30.
; PLAN: r0=302(x), r1=129(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 129
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
