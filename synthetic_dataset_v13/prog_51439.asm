; DESCRIPTION: Renders a red box of size 72x114 starting at (360, 126).
; PLAN: r0=360(x), r1=126(y), r2=72(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 126
LDI r2, 72
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
