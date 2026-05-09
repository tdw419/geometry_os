; DESCRIPTION: Draws a blue rectangle at (276, 161) with width 20 and height 31.
; PLAN: r0=276(x), r1=161(y), r2=20(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 161
LDI r2, 20
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
