; DESCRIPTION: Draws a orange rectangle at (96, 226) with width 16 and height 27.
; PLAN: r0=96(x), r1=226(y), r2=16(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 226
LDI r2, 16
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
