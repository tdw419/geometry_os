; DESCRIPTION: Draws a cyan rectangle at (120, 119) with width 26 and height 74.
; PLAN: r0=120(x), r1=119(y), r2=26(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 119
LDI r2, 26
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
