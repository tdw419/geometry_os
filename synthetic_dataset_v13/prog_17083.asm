; DESCRIPTION: Renders a black box of size 77x59 starting at (299, 141).
; PLAN: r0=299(x), r1=141(y), r2=77(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 141
LDI r2, 77
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
