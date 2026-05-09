; DESCRIPTION: Draws a red rectangle at (496, 124) with width 14 and height 58.
; PLAN: r0=496(x), r1=124(y), r2=14(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 124
LDI r2, 14
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
