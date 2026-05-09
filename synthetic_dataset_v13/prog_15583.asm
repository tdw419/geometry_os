; DESCRIPTION: Draws a red rectangle at (240, 167) with width 59 and height 50.
; PLAN: r0=240(x), r1=167(y), r2=59(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 167
LDI r2, 59
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
