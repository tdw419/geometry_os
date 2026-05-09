; DESCRIPTION: Draws a orange rectangle at (125, 146) with width 87 and height 72.
; PLAN: r0=125(x), r1=146(y), r2=87(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 146
LDI r2, 87
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
