; DESCRIPTION: Draws a green rectangle at (293, 58) with width 21 and height 13.
; PLAN: r0=293(x), r1=58(y), r2=21(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 58
LDI r2, 21
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
