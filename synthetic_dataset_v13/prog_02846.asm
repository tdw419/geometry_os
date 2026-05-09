; DESCRIPTION: Renders a white box of size 116x64 starting at (192, 100).
; PLAN: r0=192(x), r1=100(y), r2=116(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 100
LDI r2, 116
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
