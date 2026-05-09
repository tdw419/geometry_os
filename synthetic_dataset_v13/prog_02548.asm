; DESCRIPTION: Draws a yellow rectangle at (411, 31) with width 89 and height 32.
; PLAN: r0=411(x), r1=31(y), r2=89(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 31
LDI r2, 89
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
