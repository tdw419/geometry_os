; DESCRIPTION: Draws a cyan rectangle at (130, 9) with width 74 and height 107.
; PLAN: r0=130(x), r1=9(y), r2=74(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 9
LDI r2, 74
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
