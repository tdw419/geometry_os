; DESCRIPTION: Draws a black rectangle at (295, 96) with width 80 and height 43.
; PLAN: r0=295(x), r1=96(y), r2=80(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 96
LDI r2, 80
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
