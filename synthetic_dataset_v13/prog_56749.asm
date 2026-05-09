; DESCRIPTION: Draws a cyan rectangle at (427, 196) with width 84 and height 57.
; PLAN: r0=427(x), r1=196(y), r2=84(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 196
LDI r2, 84
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
