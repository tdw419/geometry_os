; DESCRIPTION: Draws a orange rectangle at (192, 44) with width 108 and height 111.
; PLAN: r0=192(x), r1=44(y), r2=108(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 44
LDI r2, 108
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
