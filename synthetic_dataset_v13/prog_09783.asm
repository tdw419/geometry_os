; DESCRIPTION: Draws a green rectangle at (202, 74) with width 85 and height 98.
; PLAN: r0=202(x), r1=74(y), r2=85(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 74
LDI r2, 85
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
