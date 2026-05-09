; DESCRIPTION: Draws a orange rectangle at (244, 131) with width 86 and height 19.
; PLAN: r0=244(x), r1=131(y), r2=86(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 131
LDI r2, 86
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
