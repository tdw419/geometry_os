; DESCRIPTION: Draws a white rectangle at (450, 178) with width 47 and height 39.
; PLAN: r0=450(x), r1=178(y), r2=47(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 178
LDI r2, 47
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
