; DESCRIPTION: Draws a orange rectangle at (130, 45) with width 31 and height 55.
; PLAN: r0=130(x), r1=45(y), r2=31(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 45
LDI r2, 31
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
