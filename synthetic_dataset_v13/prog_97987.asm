; DESCRIPTION: Draws a orange rectangle at (196, 41) with width 107 and height 57.
; PLAN: r0=196(x), r1=41(y), r2=107(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 41
LDI r2, 107
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
