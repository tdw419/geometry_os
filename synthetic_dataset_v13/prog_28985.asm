; DESCRIPTION: Draws a orange rectangle at (27, 96) with width 92 and height 115.
; PLAN: r0=27(x), r1=96(y), r2=92(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 96
LDI r2, 92
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
