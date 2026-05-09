; DESCRIPTION: Draws a green rectangle at (287, 168) with width 23 and height 57.
; PLAN: r0=287(x), r1=168(y), r2=23(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 168
LDI r2, 23
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
