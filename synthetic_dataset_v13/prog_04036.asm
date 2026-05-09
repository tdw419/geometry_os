; DESCRIPTION: Draws a green rectangle at (80, 83) with width 72 and height 93.
; PLAN: r0=80(x), r1=83(y), r2=72(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 83
LDI r2, 72
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
