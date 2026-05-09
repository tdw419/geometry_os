; DESCRIPTION: Draws a yellow rectangle at (54, 9) with width 16 and height 12.
; PLAN: r0=54(x), r1=9(y), r2=16(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 9
LDI r2, 16
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
