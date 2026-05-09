; DESCRIPTION: Creates a red circular shape at (127, 203) with radius 42.
; PLAN: r0=127(x), r1=203(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 203
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
