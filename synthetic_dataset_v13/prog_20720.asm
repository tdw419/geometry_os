; DESCRIPTION: Draws a cyan rectangle at (431, 134) with width 18 and height 25.
; PLAN: r0=431(x), r1=134(y), r2=18(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 134
LDI r2, 18
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
