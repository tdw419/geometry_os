; DESCRIPTION: Renders a black box of size 21x105 starting at (359, 34).
; PLAN: r0=359(x), r1=34(y), r2=21(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 34
LDI r2, 21
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
