; DESCRIPTION: Draws a red rectangle at (261, 178) with width 83 and height 21.
; PLAN: r0=261(x), r1=178(y), r2=83(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 178
LDI r2, 83
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
