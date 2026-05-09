; DESCRIPTION: Draws a cyan rectangle at (215, 43) with width 79 and height 40.
; PLAN: r0=215(x), r1=43(y), r2=79(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 43
LDI r2, 79
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
