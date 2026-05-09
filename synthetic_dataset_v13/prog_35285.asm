; DESCRIPTION: Draws a yellow rectangle at (281, 146) with width 85 and height 51.
; PLAN: r0=281(x), r1=146(y), r2=85(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 146
LDI r2, 85
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
