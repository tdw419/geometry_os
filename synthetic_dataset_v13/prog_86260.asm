; DESCRIPTION: Draws a red rectangle at (414, 191) with width 70 and height 60.
; PLAN: r0=414(x), r1=191(y), r2=70(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 191
LDI r2, 70
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
