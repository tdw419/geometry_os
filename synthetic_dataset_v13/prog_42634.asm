; DESCRIPTION: Draws a green rectangle at (38, 65) with width 111 and height 76.
; PLAN: r0=38(x), r1=65(y), r2=111(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 65
LDI r2, 111
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
