; DESCRIPTION: Draws a cyan rectangle at (58, 170) with width 11 and height 27.
; PLAN: r0=58(x), r1=170(y), r2=11(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 170
LDI r2, 11
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
