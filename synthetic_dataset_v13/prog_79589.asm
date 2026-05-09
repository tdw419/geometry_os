; DESCRIPTION: Draws a orange rectangle at (259, 92) with width 77 and height 11.
; PLAN: r0=259(x), r1=92(y), r2=77(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 92
LDI r2, 77
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
