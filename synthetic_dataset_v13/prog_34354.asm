; DESCRIPTION: Renders a green box of size 64x102 starting at (233, 78).
; PLAN: r0=233(x), r1=78(y), r2=64(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 78
LDI r2, 64
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
