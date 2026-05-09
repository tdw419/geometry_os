; DESCRIPTION: Draws a white rectangle at (261, 149) with width 47 and height 98.
; PLAN: r0=261(x), r1=149(y), r2=47(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 149
LDI r2, 47
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
