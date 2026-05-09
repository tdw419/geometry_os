; DESCRIPTION: Draws a white rectangle at (297, 39) with width 59 and height 46.
; PLAN: r0=297(x), r1=39(y), r2=59(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 39
LDI r2, 59
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
