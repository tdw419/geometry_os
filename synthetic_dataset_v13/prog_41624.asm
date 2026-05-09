; DESCRIPTION: Draws a green rectangle at (403, 63) with width 23 and height 39.
; PLAN: r0=403(x), r1=63(y), r2=23(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 63
LDI r2, 23
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
