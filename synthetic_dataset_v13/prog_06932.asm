; DESCRIPTION: Draws a cyan rectangle at (255, 17) with width 65 and height 11.
; PLAN: r0=255(x), r1=17(y), r2=65(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 17
LDI r2, 65
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
