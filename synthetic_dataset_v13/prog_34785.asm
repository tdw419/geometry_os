; DESCRIPTION: Draws a red rectangle at (391, 181) with width 107 and height 24.
; PLAN: r0=391(x), r1=181(y), r2=107(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 181
LDI r2, 107
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
