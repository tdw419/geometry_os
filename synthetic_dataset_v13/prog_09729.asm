; DESCRIPTION: Draws a green rectangle at (240, 108) with width 120 and height 71.
; PLAN: r0=240(x), r1=108(y), r2=120(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 108
LDI r2, 120
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
