; DESCRIPTION: Renders a red box of size 64x110 starting at (14, 109).
; PLAN: r0=14(x), r1=109(y), r2=64(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 109
LDI r2, 64
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
