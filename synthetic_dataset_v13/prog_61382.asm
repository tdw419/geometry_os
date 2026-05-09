; DESCRIPTION: Draws a green rectangle at (60, 16) with width 112 and height 97.
; PLAN: r0=60(x), r1=16(y), r2=112(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 16
LDI r2, 112
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
