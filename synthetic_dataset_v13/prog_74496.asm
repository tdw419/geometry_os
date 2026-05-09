; DESCRIPTION: Draws a yellow rectangle at (372, 11) with width 24 and height 108.
; PLAN: r0=372(x), r1=11(y), r2=24(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 11
LDI r2, 24
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
