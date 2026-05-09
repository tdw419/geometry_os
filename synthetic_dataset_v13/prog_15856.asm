; DESCRIPTION: Draws a cyan rectangle at (127, 41) with width 109 and height 22.
; PLAN: r0=127(x), r1=41(y), r2=109(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 41
LDI r2, 109
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
