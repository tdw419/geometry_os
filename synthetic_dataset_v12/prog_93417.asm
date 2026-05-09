; DESCRIPTION: Draws a orange rectangle at (38, 47) with width 38 and height 116.
; PLAN: r0=38(x), r1=47(y), r2=38(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 47
LDI r2, 38
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
