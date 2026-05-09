; DESCRIPTION: Draws a cyan rectangle at (350, 175) with width 83 and height 56.
; PLAN: r0=350(x), r1=175(y), r2=83(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 175
LDI r2, 83
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
