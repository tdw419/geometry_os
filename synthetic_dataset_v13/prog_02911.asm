; DESCRIPTION: Draws a green rectangle at (172, 1) with width 16 and height 47.
; PLAN: r0=172(x), r1=1(y), r2=16(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 1
LDI r2, 16
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
