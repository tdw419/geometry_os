; DESCRIPTION: Draws a orange rectangle at (160, 165) with width 111 and height 76.
; PLAN: r0=160(x), r1=165(y), r2=111(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 165
LDI r2, 111
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
