; DESCRIPTION: Draws a green rectangle at (218, 76) with width 86 and height 76.
; PLAN: r0=218(x), r1=76(y), r2=86(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 76
LDI r2, 86
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
