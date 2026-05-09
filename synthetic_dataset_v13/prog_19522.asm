; DESCRIPTION: Draws a green rectangle at (327, 2) with width 107 and height 16.
; PLAN: r0=327(x), r1=2(y), r2=107(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 2
LDI r2, 107
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
