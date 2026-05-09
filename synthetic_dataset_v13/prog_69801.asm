; DESCRIPTION: Renders a purple box of size 77x29 starting at (167, 218).
; PLAN: r0=167(x), r1=218(y), r2=77(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 218
LDI r2, 77
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
