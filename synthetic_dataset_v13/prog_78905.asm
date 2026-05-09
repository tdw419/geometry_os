; DESCRIPTION: Draws a green rectangle at (5, 7) with width 48 and height 71.
; PLAN: r0=5(x), r1=7(y), r2=48(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 7
LDI r2, 48
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
