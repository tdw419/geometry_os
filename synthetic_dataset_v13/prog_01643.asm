; DESCRIPTION: Renders a red box of size 100x37 starting at (351, 95).
; PLAN: r0=351(x), r1=95(y), r2=100(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 95
LDI r2, 100
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
