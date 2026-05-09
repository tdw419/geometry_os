; DESCRIPTION: Draws a red rectangle at (80, 127) with width 39 and height 94.
; PLAN: r0=80(x), r1=127(y), r2=39(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 127
LDI r2, 39
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
