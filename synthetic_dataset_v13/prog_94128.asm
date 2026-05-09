; DESCRIPTION: Draws a green rectangle at (59, 107) with width 120 and height 14.
; PLAN: r0=59(x), r1=107(y), r2=120(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 107
LDI r2, 120
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
