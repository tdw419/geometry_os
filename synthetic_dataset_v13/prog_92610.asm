; DESCRIPTION: Draws a yellow rectangle at (35, 146) with width 32 and height 87.
; PLAN: r0=35(x), r1=146(y), r2=32(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 146
LDI r2, 32
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
