; DESCRIPTION: Draws a orange rectangle at (353, 112) with width 93 and height 34.
; PLAN: r0=353(x), r1=112(y), r2=93(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 112
LDI r2, 93
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
