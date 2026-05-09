; DESCRIPTION: Draws a orange rectangle at (168, 41) with width 16 and height 83.
; PLAN: r0=168(x), r1=41(y), r2=16(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 41
LDI r2, 16
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
