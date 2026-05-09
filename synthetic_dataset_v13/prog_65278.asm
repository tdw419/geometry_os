; DESCRIPTION: Renders a white box of size 21x114 starting at (238, 95).
; PLAN: r0=238(x), r1=95(y), r2=21(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 95
LDI r2, 21
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
