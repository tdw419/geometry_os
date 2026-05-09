; DESCRIPTION: Draws a green rectangle at (288, 206) with width 23 and height 39.
; PLAN: r0=288(x), r1=206(y), r2=23(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 206
LDI r2, 23
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
