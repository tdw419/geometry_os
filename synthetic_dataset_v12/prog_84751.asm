; DESCRIPTION: Draws a yellow rectangle at (180, 167) with width 57 and height 55.
; PLAN: r0=180(x), r1=167(y), r2=57(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 167
LDI r2, 57
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
