; DESCRIPTION: Creates a red circular shape at (135, 143) with radius 42.
; PLAN: r0=135(x), r1=143(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 143
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
