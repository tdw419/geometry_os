; DESCRIPTION: Creates a red circular shape at (70, 144) with radius 16.
; PLAN: r0=70(x), r1=144(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 144
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
