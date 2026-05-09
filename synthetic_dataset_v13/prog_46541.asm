; DESCRIPTION: Renders a white box of size 19x102 starting at (268, 126).
; PLAN: r0=268(x), r1=126(y), r2=19(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 126
LDI r2, 19
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
