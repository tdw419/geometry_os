; DESCRIPTION: Draws a red rectangle at (88, 160) with width 91 and height 34.
; PLAN: r0=88(x), r1=160(y), r2=91(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 160
LDI r2, 91
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
