; DESCRIPTION: Draws a black rectangle at (78, 202) with width 76 and height 27.
; PLAN: r0=78(x), r1=202(y), r2=76(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 202
LDI r2, 76
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
