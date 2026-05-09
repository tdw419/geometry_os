; DESCRIPTION: Draws a orange rectangle at (13, 210) with width 50 and height 21.
; PLAN: r0=13(x), r1=210(y), r2=50(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 210
LDI r2, 50
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
