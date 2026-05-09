; DESCRIPTION: Renders a red box of size 15x11 starting at (232, 17).
; PLAN: r0=232(x), r1=17(y), r2=15(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 17
LDI r2, 15
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
