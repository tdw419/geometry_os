; DESCRIPTION: Renders a black box of size 50x80 starting at (343, 22).
; PLAN: r0=343(x), r1=22(y), r2=50(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 22
LDI r2, 50
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
