; DESCRIPTION: Renders a white box of size 109x64 starting at (47, 19).
; PLAN: r0=47(x), r1=19(y), r2=109(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 19
LDI r2, 109
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
