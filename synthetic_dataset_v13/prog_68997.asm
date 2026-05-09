; DESCRIPTION: Draws a green rectangle at (63, 191) with width 58 and height 40.
; PLAN: r0=63(x), r1=191(y), r2=58(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 191
LDI r2, 58
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
