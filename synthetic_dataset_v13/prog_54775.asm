; DESCRIPTION: Draws a orange rectangle at (231, 130) with width 111 and height 104.
; PLAN: r0=231(x), r1=130(y), r2=111(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 130
LDI r2, 111
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
