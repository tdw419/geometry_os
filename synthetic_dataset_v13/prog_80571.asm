; DESCRIPTION: Draws a orange rectangle at (362, 70) with width 29 and height 85.
; PLAN: r0=362(x), r1=70(y), r2=29(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 70
LDI r2, 29
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
