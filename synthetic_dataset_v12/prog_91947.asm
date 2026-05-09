; DESCRIPTION: Creates a purple circular shape at (225, 129) with radius 54.
; PLAN: r0=225(x), r1=129(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 129
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
