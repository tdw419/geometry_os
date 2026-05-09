; DESCRIPTION: Renders a red box of size 25x14 starting at (297, 122).
; PLAN: r0=297(x), r1=122(y), r2=25(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 122
LDI r2, 25
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
