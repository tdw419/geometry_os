; DESCRIPTION: Draws a orange rectangle at (385, 14) with width 16 and height 117.
; PLAN: r0=385(x), r1=14(y), r2=16(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 14
LDI r2, 16
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
