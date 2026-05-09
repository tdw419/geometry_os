; DESCRIPTION: Renders a red box of size 53x27 starting at (192, 99).
; PLAN: r0=192(x), r1=99(y), r2=53(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 99
LDI r2, 53
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
