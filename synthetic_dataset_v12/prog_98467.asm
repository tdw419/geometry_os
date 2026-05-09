; DESCRIPTION: Creates a white circular shape at (225, 129) with radius 25.
; PLAN: r0=225(x), r1=129(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 129
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
