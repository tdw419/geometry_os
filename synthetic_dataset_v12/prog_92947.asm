; DESCRIPTION: Draws a white rectangle at (410, 233) with width 67 and height 17.
; PLAN: r0=410(x), r1=233(y), r2=67(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 233
LDI r2, 67
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
