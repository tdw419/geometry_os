; DESCRIPTION: Renders a red box of size 64x36 starting at (310, 218).
; PLAN: r0=310(x), r1=218(y), r2=64(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 218
LDI r2, 64
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
