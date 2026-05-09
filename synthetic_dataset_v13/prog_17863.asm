; DESCRIPTION: Draws a red rectangle at (362, 133) with width 28 and height 98.
; PLAN: r0=362(x), r1=133(y), r2=28(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 133
LDI r2, 28
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
