; DESCRIPTION: Draws a cyan rectangle at (213, 176) with width 89 and height 65.
; PLAN: r0=213(x), r1=176(y), r2=89(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 176
LDI r2, 89
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
