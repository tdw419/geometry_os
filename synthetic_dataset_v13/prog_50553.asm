; DESCRIPTION: Draws a red rectangle at (261, 130) with width 63 and height 120.
; PLAN: r0=261(x), r1=130(y), r2=63(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 130
LDI r2, 63
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
