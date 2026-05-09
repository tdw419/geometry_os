; DESCRIPTION: Draws a orange rectangle at (440, 108) with width 40 and height 24.
; PLAN: r0=440(x), r1=108(y), r2=40(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 108
LDI r2, 40
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
