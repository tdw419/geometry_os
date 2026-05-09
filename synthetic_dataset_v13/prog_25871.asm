; DESCRIPTION: Creates a green circular shape at (146, 92) with radius 37.
; PLAN: r0=146(x), r1=92(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 92
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
