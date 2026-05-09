; DESCRIPTION: Draws a orange rectangle at (127, 64) with width 90 and height 98.
; PLAN: r0=127(x), r1=64(y), r2=90(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 64
LDI r2, 90
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
