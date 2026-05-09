; DESCRIPTION: Draws a orange rectangle at (382, 74) with width 116 and height 87.
; PLAN: r0=382(x), r1=74(y), r2=116(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 74
LDI r2, 116
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
