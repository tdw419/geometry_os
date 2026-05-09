; DESCRIPTION: Draws a yellow rectangle at (239, 77) with width 109 and height 97.
; PLAN: r0=239(x), r1=77(y), r2=109(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 77
LDI r2, 109
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
