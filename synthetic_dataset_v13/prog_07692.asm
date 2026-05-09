; DESCRIPTION: Draws a green rectangle at (335, 93) with width 19 and height 16.
; PLAN: r0=335(x), r1=93(y), r2=19(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 93
LDI r2, 19
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
