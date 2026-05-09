; DESCRIPTION: Creates a red circular shape at (237, 152) with radius 56.
; PLAN: r0=237(x), r1=152(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 152
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
