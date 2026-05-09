; DESCRIPTION: Draws a orange rectangle at (326, 159) with width 91 and height 58.
; PLAN: r0=326(x), r1=159(y), r2=91(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 159
LDI r2, 91
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
