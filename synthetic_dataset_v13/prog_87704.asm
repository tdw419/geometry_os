; DESCRIPTION: Draws a red rectangle at (248, 111) with width 15 and height 98.
; PLAN: r0=248(x), r1=111(y), r2=15(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 111
LDI r2, 15
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
