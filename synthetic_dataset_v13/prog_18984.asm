; DESCRIPTION: Draws a orange rectangle at (102, 33) with width 34 and height 24.
; PLAN: r0=102(x), r1=33(y), r2=34(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 33
LDI r2, 34
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
