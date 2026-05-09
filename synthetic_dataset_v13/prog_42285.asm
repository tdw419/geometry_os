; DESCRIPTION: Draws a cyan rectangle at (175, 151) with width 18 and height 83.
; PLAN: r0=175(x), r1=151(y), r2=18(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 151
LDI r2, 18
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
