; DESCRIPTION: Draws a orange rectangle at (365, 133) with width 99 and height 80.
; PLAN: r0=365(x), r1=133(y), r2=99(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 133
LDI r2, 99
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
