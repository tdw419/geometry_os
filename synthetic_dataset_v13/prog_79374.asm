; DESCRIPTION: Draws a red rectangle at (321, 94) with width 60 and height 90.
; PLAN: r0=321(x), r1=94(y), r2=60(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 94
LDI r2, 60
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
