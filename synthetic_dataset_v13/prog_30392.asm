; DESCRIPTION: Draws a orange rectangle at (269, 81) with width 82 and height 12.
; PLAN: r0=269(x), r1=81(y), r2=82(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 81
LDI r2, 82
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
