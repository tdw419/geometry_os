; DESCRIPTION: Draws a yellow rectangle at (167, 71) with width 47 and height 120.
; PLAN: r0=167(x), r1=71(y), r2=47(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 71
LDI r2, 47
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
