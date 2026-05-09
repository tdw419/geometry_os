; DESCRIPTION: Draws a white rectangle at (99, 161) with width 92 and height 91.
; PLAN: r0=99(x), r1=161(y), r2=92(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 161
LDI r2, 92
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
