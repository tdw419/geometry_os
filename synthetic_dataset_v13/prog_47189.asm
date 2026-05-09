; DESCRIPTION: Draws a cyan rectangle at (183, 7) with width 76 and height 25.
; PLAN: r0=183(x), r1=7(y), r2=76(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 7
LDI r2, 76
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
