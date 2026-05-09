; DESCRIPTION: Draws a orange rectangle at (186, 29) with width 79 and height 86.
; PLAN: r0=186(x), r1=29(y), r2=79(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 29
LDI r2, 79
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
