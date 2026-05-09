; DESCRIPTION: Draws a orange rectangle at (109, 107) with width 41 and height 27.
; PLAN: r0=109(x), r1=107(y), r2=41(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 107
LDI r2, 41
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
