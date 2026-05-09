; DESCRIPTION: Draws a orange rectangle at (48, 116) with width 47 and height 89.
; PLAN: r0=48(x), r1=116(y), r2=47(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 116
LDI r2, 47
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
