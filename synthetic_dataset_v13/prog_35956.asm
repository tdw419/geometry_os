; DESCRIPTION: Creates a green circular shape at (460, 109) with radius 25.
; PLAN: r0=460(x), r1=109(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 109
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
