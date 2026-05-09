; DESCRIPTION: Draws a yellow rectangle at (372, 57) with width 83 and height 94.
; PLAN: r0=372(x), r1=57(y), r2=83(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 57
LDI r2, 83
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
