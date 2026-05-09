; DESCRIPTION: Draws a green rectangle at (308, 39) with width 63 and height 38.
; PLAN: r0=308(x), r1=39(y), r2=63(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 39
LDI r2, 63
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
