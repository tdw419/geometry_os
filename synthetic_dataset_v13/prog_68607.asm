; DESCRIPTION: Draws a orange rectangle at (27, 168) with width 84 and height 34.
; PLAN: r0=27(x), r1=168(y), r2=84(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 168
LDI r2, 84
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
