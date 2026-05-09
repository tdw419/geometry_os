; DESCRIPTION: Draws a white rectangle at (475, 186) with width 18 and height 67.
; PLAN: r0=475(x), r1=186(y), r2=18(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 186
LDI r2, 18
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
