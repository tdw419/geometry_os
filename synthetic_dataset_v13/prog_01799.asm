; DESCRIPTION: Draws a orange rectangle at (387, 216) with width 113 and height 24.
; PLAN: r0=387(x), r1=216(y), r2=113(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 216
LDI r2, 113
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
