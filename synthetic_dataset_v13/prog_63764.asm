; DESCRIPTION: Renders a red box of size 59x17 starting at (119, 222).
; PLAN: r0=119(x), r1=222(y), r2=59(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 222
LDI r2, 59
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
