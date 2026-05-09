; DESCRIPTION: Draws a orange rectangle at (252, 206) with width 96 and height 32.
; PLAN: r0=252(x), r1=206(y), r2=96(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 206
LDI r2, 96
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
