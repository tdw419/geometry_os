; DESCRIPTION: Creates a red circular shape at (450, 56) with radius 10.
; PLAN: r0=450(x), r1=56(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 56
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
