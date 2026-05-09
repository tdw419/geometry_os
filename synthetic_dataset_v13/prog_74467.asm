; DESCRIPTION: Draws a yellow rectangle at (233, 146) with width 50 and height 32.
; PLAN: r0=233(x), r1=146(y), r2=50(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 146
LDI r2, 50
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
