; DESCRIPTION: Creates a red circular shape at (350, 27) with radius 10.
; PLAN: r0=350(x), r1=27(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 27
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
