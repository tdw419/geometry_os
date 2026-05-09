; DESCRIPTION: Renders a red box of size 35x105 starting at (189, 8).
; PLAN: r0=189(x), r1=8(y), r2=35(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 8
LDI r2, 35
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
