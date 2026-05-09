; DESCRIPTION: Draws a black rectangle at (407, 107) with width 38 and height 71.
; PLAN: r0=407(x), r1=107(y), r2=38(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 107
LDI r2, 38
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
