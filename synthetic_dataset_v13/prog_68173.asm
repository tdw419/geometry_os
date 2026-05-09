; DESCRIPTION: Draws a cyan rectangle at (407, 18) with width 17 and height 70.
; PLAN: r0=407(x), r1=18(y), r2=17(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 18
LDI r2, 17
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
