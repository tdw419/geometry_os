; DESCRIPTION: Draws a red rectangle at (362, 13) with width 115 and height 99.
; PLAN: r0=362(x), r1=13(y), r2=115(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 13
LDI r2, 115
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
