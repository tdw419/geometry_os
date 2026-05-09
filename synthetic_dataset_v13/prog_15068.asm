; DESCRIPTION: Draws a cyan rectangle at (0, 78) with width 28 and height 119.
; PLAN: r0=0(x), r1=78(y), r2=28(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 78
LDI r2, 28
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
