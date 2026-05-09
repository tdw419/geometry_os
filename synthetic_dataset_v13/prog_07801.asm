; DESCRIPTION: Draws a yellow rectangle at (337, 140) with width 68 and height 76.
; PLAN: r0=337(x), r1=140(y), r2=68(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 140
LDI r2, 68
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
