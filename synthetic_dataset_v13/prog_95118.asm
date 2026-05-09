; DESCRIPTION: Draws a red rectangle at (37, 191) with width 68 and height 63.
; PLAN: r0=37(x), r1=191(y), r2=68(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 191
LDI r2, 68
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
