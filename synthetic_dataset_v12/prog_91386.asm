; DESCRIPTION: Draws a orange rectangle at (54, 13) with width 120 and height 12.
; PLAN: r0=54(x), r1=13(y), r2=120(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 13
LDI r2, 120
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
