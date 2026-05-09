; DESCRIPTION: Draws a cyan rectangle at (108, 75) with width 80 and height 17.
; PLAN: r0=108(x), r1=75(y), r2=80(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 75
LDI r2, 80
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
