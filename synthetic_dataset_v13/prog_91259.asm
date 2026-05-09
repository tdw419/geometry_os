; DESCRIPTION: Draws a orange rectangle at (158, 171) with width 16 and height 40.
; PLAN: r0=158(x), r1=171(y), r2=16(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 171
LDI r2, 16
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
