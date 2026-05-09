; DESCRIPTION: Draws a orange rectangle at (330, 47) with width 52 and height 81.
; PLAN: r0=330(x), r1=47(y), r2=52(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 47
LDI r2, 52
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
