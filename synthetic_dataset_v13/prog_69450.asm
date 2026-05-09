; DESCRIPTION: Draws a yellow rectangle at (60, 146) with width 63 and height 77.
; PLAN: r0=60(x), r1=146(y), r2=63(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 146
LDI r2, 63
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
