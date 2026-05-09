; DESCRIPTION: Draws a cyan rectangle at (433, 78) with width 56 and height 107.
; PLAN: r0=433(x), r1=78(y), r2=56(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 78
LDI r2, 56
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
