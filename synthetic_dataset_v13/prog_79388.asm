; DESCRIPTION: Draws a cyan rectangle at (136, 46) with width 114 and height 120.
; PLAN: r0=136(x), r1=46(y), r2=114(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 46
LDI r2, 114
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
