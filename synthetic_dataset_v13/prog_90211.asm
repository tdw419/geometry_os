; DESCRIPTION: Draws a cyan rectangle at (358, 65) with width 81 and height 21.
; PLAN: r0=358(x), r1=65(y), r2=81(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 65
LDI r2, 81
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
