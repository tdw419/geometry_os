; DESCRIPTION: Draws a orange rectangle at (214, 45) with width 26 and height 46.
; PLAN: r0=214(x), r1=45(y), r2=26(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 45
LDI r2, 26
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
