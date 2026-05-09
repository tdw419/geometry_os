; DESCRIPTION: Draws a green rectangle at (395, 46) with width 77 and height 109.
; PLAN: r0=395(x), r1=46(y), r2=77(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 46
LDI r2, 77
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
