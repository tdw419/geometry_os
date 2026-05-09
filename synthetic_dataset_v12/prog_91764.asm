; DESCRIPTION: Draws a yellow rectangle at (370, 25) with width 16 and height 60.
; PLAN: r0=370(x), r1=25(y), r2=16(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 25
LDI r2, 16
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
