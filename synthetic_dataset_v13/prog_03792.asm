; DESCRIPTION: Draws a cyan rectangle at (68, 183) with width 41 and height 32.
; PLAN: r0=68(x), r1=183(y), r2=41(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 183
LDI r2, 41
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
