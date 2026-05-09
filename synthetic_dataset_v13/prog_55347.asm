; DESCRIPTION: Draws a green rectangle at (193, 217) with width 86 and height 23.
; PLAN: r0=193(x), r1=217(y), r2=86(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 217
LDI r2, 86
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
