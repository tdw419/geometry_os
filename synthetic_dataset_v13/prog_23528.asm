; DESCRIPTION: Creates a red circular shape at (443, 154) with radius 61.
; PLAN: r0=443(x), r1=154(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 154
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
