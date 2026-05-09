; DESCRIPTION: Draws a green rectangle at (234, 33) with width 13 and height 112.
; PLAN: r0=234(x), r1=33(y), r2=13(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 33
LDI r2, 13
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
