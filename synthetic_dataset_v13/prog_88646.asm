; DESCRIPTION: Draws a cyan rectangle at (427, 13) with width 32 and height 25.
; PLAN: r0=427(x), r1=13(y), r2=32(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 13
LDI r2, 32
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
