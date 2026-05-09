; DESCRIPTION: Draws a red rectangle at (185, 38) with width 37 and height 93.
; PLAN: r0=185(x), r1=38(y), r2=37(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 38
LDI r2, 37
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
