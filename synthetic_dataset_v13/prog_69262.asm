; DESCRIPTION: Draws a white rectangle at (214, 14) with width 26 and height 47.
; PLAN: r0=214(x), r1=14(y), r2=26(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 14
LDI r2, 26
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
