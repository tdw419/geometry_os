; DESCRIPTION: Draws a yellow rectangle at (289, 133) with width 65 and height 46.
; PLAN: r0=289(x), r1=133(y), r2=65(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 133
LDI r2, 65
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
