; DESCRIPTION: Renders a white box of size 14x11 starting at (64, 118).
; PLAN: r0=64(x), r1=118(y), r2=14(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 118
LDI r2, 14
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
