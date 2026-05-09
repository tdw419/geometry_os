; DESCRIPTION: Creates a red circular shape at (245, 215) with radius 24.
; PLAN: r0=245(x), r1=215(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 215
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
