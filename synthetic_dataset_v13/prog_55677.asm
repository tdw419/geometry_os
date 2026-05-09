; DESCRIPTION: Draws a orange rectangle at (126, 161) with width 46 and height 36.
; PLAN: r0=126(x), r1=161(y), r2=46(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 161
LDI r2, 46
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
