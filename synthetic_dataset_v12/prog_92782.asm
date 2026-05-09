; DESCRIPTION: Draws a orange rectangle at (245, 50) with width 29 and height 58.
; PLAN: r0=245(x), r1=50(y), r2=29(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 50
LDI r2, 29
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
