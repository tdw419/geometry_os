; DESCRIPTION: Draws a red rectangle at (97, 107) with width 80 and height 49.
; PLAN: r0=97(x), r1=107(y), r2=80(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 107
LDI r2, 80
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
