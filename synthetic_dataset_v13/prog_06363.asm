; DESCRIPTION: Draws a blue rectangle at (187, 52) with width 86 and height 108.
; PLAN: r0=187(x), r1=52(y), r2=86(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 52
LDI r2, 86
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
