; DESCRIPTION: Renders a black box of size 74x12 starting at (140, 38).
; PLAN: r0=140(x), r1=38(y), r2=74(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 38
LDI r2, 74
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
