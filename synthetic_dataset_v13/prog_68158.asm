; DESCRIPTION: Creates a green circular shape at (305, 115) with radius 54.
; PLAN: r0=305(x), r1=115(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 115
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
