; DESCRIPTION: Draws a orange rectangle at (431, 95) with width 28 and height 32.
; PLAN: r0=431(x), r1=95(y), r2=28(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 95
LDI r2, 28
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
