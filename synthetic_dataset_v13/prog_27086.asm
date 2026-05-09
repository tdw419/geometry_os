; DESCRIPTION: Creates a cyan circular shape at (369, 158) with radius 80.
; PLAN: r0=369(x), r1=158(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 158
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
