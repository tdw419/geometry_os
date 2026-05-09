; DESCRIPTION: Draws a white rectangle at (350, 178) with width 60 and height 35.
; PLAN: r0=350(x), r1=178(y), r2=60(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 178
LDI r2, 60
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
