; DESCRIPTION: Draws a yellow rectangle at (228, 66) with width 20 and height 61.
; PLAN: r0=228(x), r1=66(y), r2=20(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 66
LDI r2, 20
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
