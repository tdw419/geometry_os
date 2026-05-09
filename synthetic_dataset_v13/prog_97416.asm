; DESCRIPTION: Draws a orange rectangle at (182, 58) with width 37 and height 45.
; PLAN: r0=182(x), r1=58(y), r2=37(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 58
LDI r2, 37
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
