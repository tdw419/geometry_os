; DESCRIPTION: Renders a red box of size 17x102 starting at (24, 17).
; PLAN: r0=24(x), r1=17(y), r2=17(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 17
LDI r2, 17
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
