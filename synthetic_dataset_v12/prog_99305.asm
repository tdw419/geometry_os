; DESCRIPTION: Renders a white box of size 114x57 starting at (11, 26).
; PLAN: r0=11(x), r1=26(y), r2=114(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 26
LDI r2, 114
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
