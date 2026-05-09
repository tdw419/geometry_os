; DESCRIPTION: Draws a cyan rectangle at (412, 29) with width 49 and height 15.
; PLAN: r0=412(x), r1=29(y), r2=49(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 29
LDI r2, 49
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
