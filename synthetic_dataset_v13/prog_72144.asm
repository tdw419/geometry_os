; DESCRIPTION: Renders a red box of size 84x37 starting at (397, 108).
; PLAN: r0=397(x), r1=108(y), r2=84(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 108
LDI r2, 84
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
