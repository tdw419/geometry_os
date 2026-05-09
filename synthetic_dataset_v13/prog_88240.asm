; DESCRIPTION: Draws a cyan rectangle at (140, 167) with width 30 and height 65.
; PLAN: r0=140(x), r1=167(y), r2=30(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 167
LDI r2, 30
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
