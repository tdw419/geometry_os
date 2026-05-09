; DESCRIPTION: Draws a orange rectangle at (387, 8) with width 57 and height 105.
; PLAN: r0=387(x), r1=8(y), r2=57(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 8
LDI r2, 57
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
