; DESCRIPTION: Draws a orange rectangle at (153, 131) with width 113 and height 40.
; PLAN: r0=153(x), r1=131(y), r2=113(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 131
LDI r2, 113
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
