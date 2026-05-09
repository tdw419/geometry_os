; DESCRIPTION: Draws a orange rectangle at (267, 152) with width 50 and height 66.
; PLAN: r0=267(x), r1=152(y), r2=50(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 152
LDI r2, 50
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
