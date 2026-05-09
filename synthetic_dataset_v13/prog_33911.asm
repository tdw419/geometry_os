; DESCRIPTION: Draws a orange rectangle at (0, 187) with width 48 and height 29.
; PLAN: r0=0(x), r1=187(y), r2=48(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 187
LDI r2, 48
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
