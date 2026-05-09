; DESCRIPTION: Draws a yellow rectangle at (120, 159) with width 28 and height 24.
; PLAN: r0=120(x), r1=159(y), r2=28(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 159
LDI r2, 28
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
