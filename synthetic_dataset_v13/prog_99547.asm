; DESCRIPTION: Renders a red box of size 81x112 starting at (380, 84).
; PLAN: r0=380(x), r1=84(y), r2=81(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 84
LDI r2, 81
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
