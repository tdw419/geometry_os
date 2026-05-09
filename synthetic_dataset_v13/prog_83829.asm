; DESCRIPTION: Draws a orange rectangle at (5, 214) with width 65 and height 40.
; PLAN: r0=5(x), r1=214(y), r2=65(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 214
LDI r2, 65
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
