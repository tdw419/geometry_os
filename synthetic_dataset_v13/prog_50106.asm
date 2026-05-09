; DESCRIPTION: Renders a white box of size 42x45 starting at (343, 3).
; PLAN: r0=343(x), r1=3(y), r2=42(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 3
LDI r2, 42
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
