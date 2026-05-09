; DESCRIPTION: Draws a green rectangle at (236, 111) with width 21 and height 98.
; PLAN: r0=236(x), r1=111(y), r2=21(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 111
LDI r2, 21
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
