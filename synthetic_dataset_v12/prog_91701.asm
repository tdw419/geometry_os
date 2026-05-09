; DESCRIPTION: Draws a cyan rectangle at (264, 3) with width 39 and height 88.
; PLAN: r0=264(x), r1=3(y), r2=39(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 3
LDI r2, 39
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
