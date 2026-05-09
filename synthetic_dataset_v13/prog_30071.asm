; DESCRIPTION: Renders a black box of size 77x75 starting at (153, 27).
; PLAN: r0=153(x), r1=27(y), r2=77(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 27
LDI r2, 77
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
