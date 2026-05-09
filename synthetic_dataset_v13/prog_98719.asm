; DESCRIPTION: Draws a orange rectangle at (40, 33) with width 90 and height 109.
; PLAN: r0=40(x), r1=33(y), r2=90(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 33
LDI r2, 90
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
