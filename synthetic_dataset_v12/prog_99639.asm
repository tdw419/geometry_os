; DESCRIPTION: Draws a yellow rectangle at (459, 168) with width 50 and height 49.
; PLAN: r0=459(x), r1=168(y), r2=50(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 168
LDI r2, 50
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
