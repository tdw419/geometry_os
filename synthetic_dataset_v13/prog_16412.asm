; DESCRIPTION: Draws a red rectangle at (55, 59) with width 21 and height 94.
; PLAN: r0=55(x), r1=59(y), r2=21(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 59
LDI r2, 21
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
