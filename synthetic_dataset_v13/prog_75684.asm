; DESCRIPTION: Draws a red rectangle at (162, 153) with width 96 and height 27.
; PLAN: r0=162(x), r1=153(y), r2=96(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 153
LDI r2, 96
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
