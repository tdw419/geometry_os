; DESCRIPTION: Draws a cyan rectangle at (358, 50) with width 19 and height 44.
; PLAN: r0=358(x), r1=50(y), r2=19(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 50
LDI r2, 19
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
