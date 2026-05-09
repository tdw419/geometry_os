; DESCRIPTION: Draws a cyan rectangle at (388, 30) with width 110 and height 17.
; PLAN: r0=388(x), r1=30(y), r2=110(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 30
LDI r2, 110
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
