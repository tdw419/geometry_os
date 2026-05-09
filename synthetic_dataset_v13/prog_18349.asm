; DESCRIPTION: Renders a black box of size 31x60 starting at (194, 135).
; PLAN: r0=194(x), r1=135(y), r2=31(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 135
LDI r2, 31
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
