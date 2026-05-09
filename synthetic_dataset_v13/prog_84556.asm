; DESCRIPTION: Renders a white box of size 11x31 starting at (477, 177).
; PLAN: r0=477(x), r1=177(y), r2=11(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 177
LDI r2, 11
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
