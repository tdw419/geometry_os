; DESCRIPTION: Draws a red rectangle at (95, 192) with width 17 and height 36.
; PLAN: r0=95(x), r1=192(y), r2=17(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 192
LDI r2, 17
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
