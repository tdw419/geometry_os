; DESCRIPTION: Creates a yellow circular shape at (448, 173) with radius 18.
; PLAN: r0=448(x), r1=173(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 173
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
