; DESCRIPTION: Draws a orange rectangle at (98, 7) with width 98 and height 48.
; PLAN: r0=98(x), r1=7(y), r2=98(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 7
LDI r2, 98
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
