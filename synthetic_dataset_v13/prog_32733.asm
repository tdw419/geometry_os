; DESCRIPTION: Draws a orange rectangle at (95, 174) with width 94 and height 60.
; PLAN: r0=95(x), r1=174(y), r2=94(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 174
LDI r2, 94
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
