; DESCRIPTION: Draws a cyan rectangle at (187, 136) with width 98 and height 24.
; PLAN: r0=187(x), r1=136(y), r2=98(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 136
LDI r2, 98
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
