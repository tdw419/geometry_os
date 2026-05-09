; DESCRIPTION: Creates a green circular shape at (113, 153) with radius 16.
; PLAN: r0=113(x), r1=153(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 153
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
