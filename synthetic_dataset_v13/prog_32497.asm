; DESCRIPTION: Draws a green rectangle at (279, 59) with width 31 and height 50.
; PLAN: r0=279(x), r1=59(y), r2=31(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 59
LDI r2, 31
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
