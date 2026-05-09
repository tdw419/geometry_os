; DESCRIPTION: Draws a orange rectangle at (374, 172) with width 77 and height 48.
; PLAN: r0=374(x), r1=172(y), r2=77(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 172
LDI r2, 77
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
