; DESCRIPTION: Draws a cyan rectangle at (430, 54) with width 41 and height 42.
; PLAN: r0=430(x), r1=54(y), r2=41(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 54
LDI r2, 41
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
