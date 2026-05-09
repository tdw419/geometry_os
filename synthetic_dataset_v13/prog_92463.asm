; DESCRIPTION: Creates a green circular shape at (327, 216) with radius 16.
; PLAN: r0=327(x), r1=216(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 216
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
