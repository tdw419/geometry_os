; DESCRIPTION: Draws a green rectangle at (437, 94) with width 64 and height 108.
; PLAN: r0=437(x), r1=94(y), r2=64(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 94
LDI r2, 64
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
