; DESCRIPTION: Draws a green rectangle at (160, 24) with width 57 and height 93.
; PLAN: r0=160(x), r1=24(y), r2=57(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 24
LDI r2, 57
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
