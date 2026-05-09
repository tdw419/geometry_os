; DESCRIPTION: Draws a orange rectangle at (260, 120) with width 66 and height 27.
; PLAN: r0=260(x), r1=120(y), r2=66(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 120
LDI r2, 66
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
