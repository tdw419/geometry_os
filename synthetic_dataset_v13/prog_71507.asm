; DESCRIPTION: Draws a yellow rectangle at (354, 133) with width 97 and height 108.
; PLAN: r0=354(x), r1=133(y), r2=97(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 133
LDI r2, 97
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
