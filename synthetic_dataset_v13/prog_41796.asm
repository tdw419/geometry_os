; DESCRIPTION: Renders a blue box of size 77x34 starting at (47, 27).
; PLAN: r0=47(x), r1=27(y), r2=77(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 27
LDI r2, 77
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
