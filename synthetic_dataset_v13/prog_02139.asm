; DESCRIPTION: Renders a red box of size 28x43 starting at (383, 65).
; PLAN: r0=383(x), r1=65(y), r2=28(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 65
LDI r2, 28
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
