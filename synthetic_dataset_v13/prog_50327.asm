; DESCRIPTION: Renders a red box of size 43x94 starting at (310, 129).
; PLAN: r0=310(x), r1=129(y), r2=43(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 129
LDI r2, 43
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
