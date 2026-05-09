; DESCRIPTION: Draws a orange rectangle at (423, 67) with width 81 and height 93.
; PLAN: r0=423(x), r1=67(y), r2=81(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 67
LDI r2, 81
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
