; DESCRIPTION: Draws a red rectangle at (331, 96) with width 89 and height 91.
; PLAN: r0=331(x), r1=96(y), r2=89(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 96
LDI r2, 89
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
