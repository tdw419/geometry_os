; DESCRIPTION: Renders a red box of size 19x68 starting at (397, 13).
; PLAN: r0=397(x), r1=13(y), r2=19(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 13
LDI r2, 19
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
