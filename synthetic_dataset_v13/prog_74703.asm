; DESCRIPTION: Creates a green circular shape at (81, 150) with radius 16.
; PLAN: r0=81(x), r1=150(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 150
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
