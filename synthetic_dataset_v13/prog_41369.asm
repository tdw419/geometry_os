; DESCRIPTION: Draws a red rectangle at (391, 104) with width 109 and height 98.
; PLAN: r0=391(x), r1=104(y), r2=109(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 104
LDI r2, 109
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
