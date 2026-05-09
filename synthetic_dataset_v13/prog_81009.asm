; DESCRIPTION: Draws a cyan rectangle at (340, 80) with width 66 and height 17.
; PLAN: r0=340(x), r1=80(y), r2=66(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 80
LDI r2, 66
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
