; DESCRIPTION: Draws a green rectangle at (387, 159) with width 44 and height 22.
; PLAN: r0=387(x), r1=159(y), r2=44(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 159
LDI r2, 44
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
