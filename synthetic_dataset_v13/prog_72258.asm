; DESCRIPTION: Draws a orange rectangle at (90, 32) with width 46 and height 94.
; PLAN: r0=90(x), r1=32(y), r2=46(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 32
LDI r2, 46
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
