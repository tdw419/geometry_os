; DESCRIPTION: Draws a white rectangle at (7, 205) with width 113 and height 44.
; PLAN: r0=7(x), r1=205(y), r2=113(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 205
LDI r2, 113
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
