; DESCRIPTION: Creates a red circular shape at (249, 228) with radius 14.
; PLAN: r0=249(x), r1=228(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 228
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
