; DESCRIPTION: Draws a red rectangle at (333, 91) with width 102 and height 115.
; PLAN: r0=333(x), r1=91(y), r2=102(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 91
LDI r2, 102
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
