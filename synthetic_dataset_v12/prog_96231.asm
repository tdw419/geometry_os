; DESCRIPTION: Draws a white rectangle at (231, 127) with width 23 and height 99.
; PLAN: r0=231(x), r1=127(y), r2=23(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 127
LDI r2, 23
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
