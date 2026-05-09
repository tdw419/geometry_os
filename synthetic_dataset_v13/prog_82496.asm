; DESCRIPTION: Draws a orange rectangle at (280, 6) with width 45 and height 47.
; PLAN: r0=280(x), r1=6(y), r2=45(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 6
LDI r2, 45
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
