; DESCRIPTION: Draws a cyan rectangle at (441, 135) with width 17 and height 90.
; PLAN: r0=441(x), r1=135(y), r2=17(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 135
LDI r2, 17
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
