; DESCRIPTION: Draws a red rectangle at (220, 38) with width 39 and height 118.
; PLAN: r0=220(x), r1=38(y), r2=39(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 38
LDI r2, 39
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
