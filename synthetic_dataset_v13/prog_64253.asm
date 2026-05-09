; DESCRIPTION: Draws a white rectangle at (68, 30) with width 109 and height 47.
; PLAN: r0=68(x), r1=30(y), r2=109(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 30
LDI r2, 109
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
