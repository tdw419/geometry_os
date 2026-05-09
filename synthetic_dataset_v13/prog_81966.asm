; DESCRIPTION: Draws a green rectangle at (174, 180) with width 115 and height 67.
; PLAN: r0=174(x), r1=180(y), r2=115(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 180
LDI r2, 115
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
