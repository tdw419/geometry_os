; DESCRIPTION: Draws a green rectangle at (193, 5) with width 72 and height 94.
; PLAN: r0=193(x), r1=5(y), r2=72(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 5
LDI r2, 72
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
