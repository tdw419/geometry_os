; DESCRIPTION: Renders a red box of size 105x81 starting at (212, 104).
; PLAN: r0=212(x), r1=104(y), r2=105(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 104
LDI r2, 105
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
