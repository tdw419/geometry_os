; DESCRIPTION: Draws a orange rectangle at (278, 44) with width 45 and height 75.
; PLAN: r0=278(x), r1=44(y), r2=45(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 44
LDI r2, 45
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
