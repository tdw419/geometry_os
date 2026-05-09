; DESCRIPTION: Creates a black circular shape at (176, 231) with radius 20.
; PLAN: r0=176(x), r1=231(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 231
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
