; DESCRIPTION: Draws a cyan rectangle at (18, 72) with width 98 and height 74.
; PLAN: r0=18(x), r1=72(y), r2=98(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 72
LDI r2, 98
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
