; DESCRIPTION: Draws a cyan rectangle at (49, 170) with width 86 and height 33.
; PLAN: r0=49(x), r1=170(y), r2=86(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 170
LDI r2, 86
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
