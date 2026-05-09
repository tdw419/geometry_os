; DESCRIPTION: Renders a red box of size 26x20 starting at (209, 90).
; PLAN: r0=209(x), r1=90(y), r2=26(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 90
LDI r2, 26
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
