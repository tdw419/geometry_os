; DESCRIPTION: Draws a cyan rectangle at (265, 1) with width 37 and height 20.
; PLAN: r0=265(x), r1=1(y), r2=37(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 1
LDI r2, 37
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
