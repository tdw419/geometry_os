; DESCRIPTION: Draws a cyan rectangle at (472, 45) with width 13 and height 24.
; PLAN: r0=472(x), r1=45(y), r2=13(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 45
LDI r2, 13
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
