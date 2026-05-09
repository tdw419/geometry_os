; DESCRIPTION: Draws a red rectangle at (314, 96) with width 91 and height 86.
; PLAN: r0=314(x), r1=96(y), r2=91(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 96
LDI r2, 91
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
