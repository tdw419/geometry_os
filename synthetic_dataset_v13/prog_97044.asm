; DESCRIPTION: Renders a red box of size 113x114 starting at (252, 32).
; PLAN: r0=252(x), r1=32(y), r2=113(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 32
LDI r2, 113
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
