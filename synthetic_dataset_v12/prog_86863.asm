; DESCRIPTION: Renders a red box of size 55x37 starting at (134, 199).
; PLAN: r0=134(x), r1=199(y), r2=55(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 199
LDI r2, 55
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
