; DESCRIPTION: Renders a white box of size 106x12 starting at (167, 151).
; PLAN: r0=167(x), r1=151(y), r2=106(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 151
LDI r2, 106
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
