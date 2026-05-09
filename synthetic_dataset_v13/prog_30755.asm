; DESCRIPTION: Draws a red rectangle at (431, 107) with width 40 and height 58.
; PLAN: r0=431(x), r1=107(y), r2=40(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 107
LDI r2, 40
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
