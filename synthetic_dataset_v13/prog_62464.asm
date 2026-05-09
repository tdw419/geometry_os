; DESCRIPTION: Draws a green rectangle at (215, 112) with width 91 and height 83.
; PLAN: r0=215(x), r1=112(y), r2=91(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 112
LDI r2, 91
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
