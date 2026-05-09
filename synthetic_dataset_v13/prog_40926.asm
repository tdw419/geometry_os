; DESCRIPTION: Draws a orange rectangle at (387, 110) with width 17 and height 65.
; PLAN: r0=387(x), r1=110(y), r2=17(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 110
LDI r2, 17
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
