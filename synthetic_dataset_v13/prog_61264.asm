; DESCRIPTION: Renders a red box of size 73x17 starting at (269, 73).
; PLAN: r0=269(x), r1=73(y), r2=73(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 73
LDI r2, 73
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
