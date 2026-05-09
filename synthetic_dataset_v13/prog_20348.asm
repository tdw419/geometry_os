; DESCRIPTION: Draws a orange rectangle at (441, 28) with width 65 and height 93.
; PLAN: r0=441(x), r1=28(y), r2=65(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 28
LDI r2, 65
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
