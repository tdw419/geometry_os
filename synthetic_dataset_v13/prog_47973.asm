; DESCRIPTION: Renders a red box of size 26x93 starting at (411, 85).
; PLAN: r0=411(x), r1=85(y), r2=26(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 85
LDI r2, 26
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
