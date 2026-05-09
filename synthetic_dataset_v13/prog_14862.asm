; DESCRIPTION: Renders a white box of size 42x95 starting at (7, 151).
; PLAN: r0=7(x), r1=151(y), r2=42(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 151
LDI r2, 42
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
