; DESCRIPTION: Renders a white box of size 100x37 starting at (64, 12).
; PLAN: r0=64(x), r1=12(y), r2=100(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 12
LDI r2, 100
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
