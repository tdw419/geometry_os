; DESCRIPTION: Draws a orange rectangle at (295, 172) with width 74 and height 45.
; PLAN: r0=295(x), r1=172(y), r2=74(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 172
LDI r2, 74
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
