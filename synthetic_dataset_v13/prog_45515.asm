; DESCRIPTION: Draws a orange rectangle at (177, 59) with width 61 and height 87.
; PLAN: r0=177(x), r1=59(y), r2=61(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 59
LDI r2, 61
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
