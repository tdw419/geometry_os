; DESCRIPTION: Renders a red box of size 83x35 starting at (15, 63).
; PLAN: r0=15(x), r1=63(y), r2=83(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 63
LDI r2, 83
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
