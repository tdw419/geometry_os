; DESCRIPTION: Draws a orange rectangle at (271, 78) with width 21 and height 79.
; PLAN: r0=271(x), r1=78(y), r2=21(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 78
LDI r2, 21
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
