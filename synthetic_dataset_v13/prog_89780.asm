; DESCRIPTION: Draws a magenta rectangle at (303, 59) with width 53 and height 46.
; PLAN: r0=303(x), r1=59(y), r2=53(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 59
LDI r2, 53
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
