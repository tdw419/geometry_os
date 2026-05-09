; DESCRIPTION: Draws a cyan rectangle at (492, 97) with width 13 and height 72.
; PLAN: r0=492(x), r1=97(y), r2=13(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 97
LDI r2, 13
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
