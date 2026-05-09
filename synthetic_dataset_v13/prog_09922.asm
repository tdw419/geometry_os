; DESCRIPTION: Draws a green rectangle at (304, 107) with width 59 and height 108.
; PLAN: r0=304(x), r1=107(y), r2=59(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 107
LDI r2, 59
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
