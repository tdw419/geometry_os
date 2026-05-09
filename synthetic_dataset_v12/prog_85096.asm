; DESCRIPTION: Creates a green circular shape at (428, 121) with radius 64.
; PLAN: r0=428(x), r1=121(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 121
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
