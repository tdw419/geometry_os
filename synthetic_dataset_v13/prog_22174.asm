; DESCRIPTION: Draws a yellow rectangle at (304, 56) with width 113 and height 98.
; PLAN: r0=304(x), r1=56(y), r2=113(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 56
LDI r2, 113
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
