; DESCRIPTION: Draws a green rectangle at (59, 72) with width 95 and height 98.
; PLAN: r0=59(x), r1=72(y), r2=95(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 72
LDI r2, 95
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
