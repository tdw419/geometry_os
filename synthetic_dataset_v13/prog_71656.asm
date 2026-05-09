; DESCRIPTION: Draws a orange rectangle at (244, 51) with width 47 and height 103.
; PLAN: r0=244(x), r1=51(y), r2=47(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 51
LDI r2, 47
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
