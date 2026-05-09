; DESCRIPTION: Draws a white rectangle at (415, 130) with width 59 and height 117.
; PLAN: r0=415(x), r1=130(y), r2=59(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 130
LDI r2, 59
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
