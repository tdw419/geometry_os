; DESCRIPTION: Draws a green rectangle at (283, 46) with width 97 and height 111.
; PLAN: r0=283(x), r1=46(y), r2=97(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 46
LDI r2, 97
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
