; DESCRIPTION: Draws a cyan rectangle at (287, 139) with width 63 and height 61.
; PLAN: r0=287(x), r1=139(y), r2=63(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 139
LDI r2, 63
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
