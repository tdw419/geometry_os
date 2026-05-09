; DESCRIPTION: Draws a white rectangle at (353, 15) with width 42 and height 117.
; PLAN: r0=353(x), r1=15(y), r2=42(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 15
LDI r2, 42
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
