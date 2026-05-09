; DESCRIPTION: Draws a black rectangle at (326, 191) with width 41 and height 61.
; PLAN: r0=326(x), r1=191(y), r2=41(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 191
LDI r2, 41
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
