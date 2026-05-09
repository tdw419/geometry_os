; DESCRIPTION: Draws a yellow rectangle at (275, 62) with width 107 and height 99.
; PLAN: r0=275(x), r1=62(y), r2=107(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 62
LDI r2, 107
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
