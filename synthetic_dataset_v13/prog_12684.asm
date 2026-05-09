; DESCRIPTION: Draws a orange rectangle at (146, 136) with width 11 and height 71.
; PLAN: r0=146(x), r1=136(y), r2=11(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 136
LDI r2, 11
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
