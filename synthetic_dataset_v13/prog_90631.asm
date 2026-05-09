; DESCRIPTION: Renders a red box of size 28x114 starting at (173, 68).
; PLAN: r0=173(x), r1=68(y), r2=28(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 68
LDI r2, 28
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
