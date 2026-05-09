; DESCRIPTION: Draws a orange rectangle at (46, 111) with width 87 and height 79.
; PLAN: r0=46(x), r1=111(y), r2=87(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 111
LDI r2, 87
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
