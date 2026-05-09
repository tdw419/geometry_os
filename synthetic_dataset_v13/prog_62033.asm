; DESCRIPTION: Draws a cyan rectangle at (197, 36) with width 110 and height 107.
; PLAN: r0=197(x), r1=36(y), r2=110(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 36
LDI r2, 110
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
