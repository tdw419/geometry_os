; DESCRIPTION: Draws a cyan rectangle at (267, 122) with width 33 and height 40.
; PLAN: r0=267(x), r1=122(y), r2=33(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 122
LDI r2, 33
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
