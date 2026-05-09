; DESCRIPTION: Draws a black rectangle at (384, 90) with width 108 and height 71.
; PLAN: r0=384(x), r1=90(y), r2=108(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 90
LDI r2, 108
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
