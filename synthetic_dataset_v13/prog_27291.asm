; DESCRIPTION: Creates a red circular shape at (465, 42) with radius 13.
; PLAN: r0=465(x), r1=42(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 42
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
