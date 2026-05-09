; DESCRIPTION: Draws a red rectangle at (370, 197) with width 75 and height 49.
; PLAN: r0=370(x), r1=197(y), r2=75(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 197
LDI r2, 75
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
