; DESCRIPTION: Draws a yellow rectangle at (250, 146) with width 68 and height 74.
; PLAN: r0=250(x), r1=146(y), r2=68(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 146
LDI r2, 68
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
