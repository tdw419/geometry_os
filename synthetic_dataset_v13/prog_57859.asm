; DESCRIPTION: Draws a orange rectangle at (313, 109) with width 74 and height 95.
; PLAN: r0=313(x), r1=109(y), r2=74(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 109
LDI r2, 74
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
