; DESCRIPTION: Draws a orange rectangle at (434, 124) with width 17 and height 25.
; PLAN: r0=434(x), r1=124(y), r2=17(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 124
LDI r2, 17
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
