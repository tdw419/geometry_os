; DESCRIPTION: Draws a orange rectangle at (269, 14) with width 28 and height 83.
; PLAN: r0=269(x), r1=14(y), r2=28(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 14
LDI r2, 28
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
