; DESCRIPTION: Draws a red rectangle at (362, 3) with width 91 and height 95.
; PLAN: r0=362(x), r1=3(y), r2=91(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 3
LDI r2, 91
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
