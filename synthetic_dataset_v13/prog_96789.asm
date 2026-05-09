; DESCRIPTION: Renders a white box of size 76x64 starting at (183, 5).
; PLAN: r0=183(x), r1=5(y), r2=76(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 5
LDI r2, 76
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
