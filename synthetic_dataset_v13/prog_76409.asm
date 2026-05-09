; DESCRIPTION: Renders a red box of size 62x27 starting at (153, 218).
; PLAN: r0=153(x), r1=218(y), r2=62(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 218
LDI r2, 62
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
