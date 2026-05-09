; DESCRIPTION: Renders a red box of size 84x118 starting at (239, 118).
; PLAN: r0=239(x), r1=118(y), r2=84(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 118
LDI r2, 84
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
