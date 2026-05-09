; DESCRIPTION: Draws a red rectangle at (284, 185) with width 19 and height 43.
; PLAN: r0=284(x), r1=185(y), r2=19(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 185
LDI r2, 19
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
