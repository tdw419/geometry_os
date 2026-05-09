; DESCRIPTION: Draws a orange rectangle at (176, 108) with width 60 and height 94.
; PLAN: r0=176(x), r1=108(y), r2=60(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 108
LDI r2, 60
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
