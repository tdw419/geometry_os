; DESCRIPTION: Draws a orange rectangle at (86, 62) with width 16 and height 91.
; PLAN: r0=86(x), r1=62(y), r2=16(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 62
LDI r2, 16
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
