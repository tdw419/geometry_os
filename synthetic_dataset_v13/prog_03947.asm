; DESCRIPTION: Renders a red box of size 59x98 starting at (159, 101).
; PLAN: r0=159(x), r1=101(y), r2=59(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 101
LDI r2, 59
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
