; DESCRIPTION: Draws a orange rectangle at (445, 178) with width 10 and height 12.
; PLAN: r0=445(x), r1=178(y), r2=10(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 178
LDI r2, 10
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
