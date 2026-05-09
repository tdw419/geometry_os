; DESCRIPTION: Draws a green rectangle at (37, 191) with width 49 and height 27.
; PLAN: r0=37(x), r1=191(y), r2=49(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 191
LDI r2, 49
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
