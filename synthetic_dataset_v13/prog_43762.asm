; DESCRIPTION: Draws a yellow rectangle at (304, 50) with width 75 and height 76.
; PLAN: r0=304(x), r1=50(y), r2=75(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 50
LDI r2, 75
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
