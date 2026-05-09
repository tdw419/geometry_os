; DESCRIPTION: Draws a cyan rectangle at (122, 240) with width 68 and height 10.
; PLAN: r0=122(x), r1=240(y), r2=68(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 240
LDI r2, 68
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
