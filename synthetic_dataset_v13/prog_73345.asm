; DESCRIPTION: Draws a red rectangle at (248, 93) with width 107 and height 66.
; PLAN: r0=248(x), r1=93(y), r2=107(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 93
LDI r2, 107
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
