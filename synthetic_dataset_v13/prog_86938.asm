; DESCRIPTION: Renders a red box of size 64x37 starting at (160, 85).
; PLAN: r0=160(x), r1=85(y), r2=64(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 85
LDI r2, 64
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
