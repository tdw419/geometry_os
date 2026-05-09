; DESCRIPTION: Renders a white box of size 70x71 starting at (399, 156).
; PLAN: r0=399(x), r1=156(y), r2=70(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 156
LDI r2, 70
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
