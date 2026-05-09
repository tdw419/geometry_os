; DESCRIPTION: Draws a cyan rectangle at (358, 144) with width 77 and height 19.
; PLAN: r0=358(x), r1=144(y), r2=77(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 144
LDI r2, 77
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
