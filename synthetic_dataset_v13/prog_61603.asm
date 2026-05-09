; DESCRIPTION: Draws a cyan rectangle at (7, 29) with width 107 and height 14.
; PLAN: r0=7(x), r1=29(y), r2=107(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 29
LDI r2, 107
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
